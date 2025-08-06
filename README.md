## Infra - Configuração de Gateway e Monitoramento

### Kong
Kong é uma API Gateway e plataforma de gerenciamento de APIs de código aberto. Ele atua como um intermediário entre os clientes (consumidores) e os serviços de backend, fornecendo funcionalidades essenciais para gerenciar, proteger e monitorar APIs.

Dentre suas funções estão:
- Gerenciamento de tráfego: Através do roteamento e possibilidade de distribuição de tráfego entre instância de serviços.
- Segurança: Com a implementação de autenticação e autorização para proteção de APIS com suporte a JWT, API Keys e outros métodos.
- Rate Limiting e Controle de Acesso:
Limita o número de solicitações que um cliente pode fazer em um determinado período.
Ajuda a prevenir abusos e ataques DDoS.
- Transformação de Requisições e Respostas:
Modifica cabeçalhos, corpos ou parâmetros de solicitações e respostas para atender às necessidades específicas dos serviços.

### Grafana, Loki, Prometheus e Grafana Agent
#### Grafana
Grafana é uma ferramenta de visualização e monitoramento de dados. Ele permite criar dashboards interativos para exibir métricas, logs e alertas coletados de diversas fontes, como Prometheus e Loki.

#### Grafana Agent
Grafana Agent é um coletor leve que envia métricas, logs e rastreamentos para o Grafana Cloud ou para ferramentas como Prometheus e Loki. Ele unifica a coleta de dados em um único agente.

### Prometheus
Prometheus é uma ferramenta de monitoramento e alerta que coleta métricas de sistemas e serviços. Ele armazena os dados em um banco de dados de séries temporais e permite consultas com a linguagem PromQL.

### Loki
Loki é uma ferramenta de agregação e consulta de logs, projetada para funcionar de forma semelhante ao Prometheus, mas para logs. Ele organiza logs com base em labels, facilitando a busca e correlação com métricas.