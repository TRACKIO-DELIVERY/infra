local jwt_parser = require "kong.plugins.jwt.jwt_parser"

local JwtHeadersTransform = {
  PRIORITY = 999,
  VERSION = "1.0.0",
}

function JwtHeadersTransform:access(conf)
  local auth_header = kong.request.get_header("authorization")
  if not auth_header then
    return
  end

  local _, _, token = auth_header:find("Bearer%s+(.+)")
  if not token then
    kong.log.warn("Authorization header is not Bearer")
    return
  end

  local jwt, err = jwt_parser:new(token)
  if err then
    kong.log.warn("JWT parse failed: ", err)
    return
  end

  local claims = jwt.claims
  if not claims then
    return
  end

  -- Inject headers
  if claims.sub then
    kong.service.request.set_header("X-User-Id", claims.sub)
  end

  if claims.preferred_username then
    kong.service.request.set_header("X-Username", claims.preferred_username)
  end

  if claims.name then
    kong.service.request.set_header("X-Name", claims.name)
  end
  
  if claims.email then
    kong.service.request.set_header("X-Email", claims.email)
  end

  -- Optional: roles
  if claims.realm_access and claims.realm_access.roles then
    kong.service.request.set_header(
      "X-Roles",
      table.concat(claims.realm_access.roles, ",")
    )
  end
end

return JwtHeadersTransform
