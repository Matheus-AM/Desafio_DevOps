
### 🧾 `README.md`

# 🚀 DevOps Challenge - Quarkus + Docker + Minikube + Registry

Este projeto simula uma **pipeline local de CI/CD** utilizando tecnologias como Docker, Registry privado, Minikube e Kubernetes para build, push e deploy de uma aplicação Quarkus.

Ele utiliza uma arquitetura baseada em containers e scripts shell que orquestram as etapas de build, publicação da imagem e aplicação no cluster Kubernetes local.

---

## 📦 Tecnologias utilizadas

| Tecnologia      | Descrição                                                                                  |
|------------------|---------------------------------------------------------------------------------------------|
| [Quarkus](https://quarkus.io/) | Framework Java para microserviços, com foco em desempenho e startup rápidos.        |
| [Docker](https://www.docker.com/products/docker-desktop) | Containerização da aplicação e ambientes auxiliares (registry, runner, etc).       |
| [Minikube](https://minikube.sigs.k8s.io/docs/start/) | Cluster Kubernetes local para testes e desenvolvimento.                           |
| [kubectl](https://kubernetes.io/docs/tasks/tools/) | CLI para interação com o cluster Kubernetes.                                      |
| WSL2 (opcional) | Permite ambiente Linux nativo em máquinas Windows para maior compatibilidade de scripts.   |

---

## 🖥️ Pré-requisitos

Instale as seguintes ferramentas **no seu sistema operacional principal (Windows)**:

- ✅ [Docker Desktop](https://www.docker.com/products/docker-desktop)
- ✅ [Minikube](https://minikube.sigs.k8s.io/docs/start/)
- ✅ [kubectl](https://kubernetes.io/docs/tasks/tools/)
- ✅ [Git Bash](https://git-scm.com/downloads) **(necessário se você não estiver usando WSL2)**
- ✅ (Opcional) [WSL2](https://learn.microsoft.com/pt-br/windows/wsl/install) com uma distro Linux como Ubuntu

> 💡 Recomendado: executar o projeto via **WSL2** para evitar problemas de path (Linux vs Windows) com Docker, Minikube e kubectl.

---

## contexto
arquitetura no meu docker local: um runner que vai executar a pipeline (container 1), registry local (container 2), minikube (container 3). Todos estão na mesma docker-network para que o registry seja acessível pelo minikube. O container 1 compartilha do docker.sock do WSL2 que o executa para poder buildar um container do getting started do quarkus.


## 📁 Estrutura do projeto

```bash
Desafio_DevOps
├── Artefatos                          # Capturas de tela dos testes e execução
│   └── ...
├── local-pipelines                   # Pipeline e arquivos auxiliares
│   ├── Dockerfile.runner             # Imagem do Runner da pipeline
│   ├── k8s                           # Manifests Kubernetes
│   │   ├── deployment.yaml
│   │   ├── namespace.yaml
│   │   └── service.yaml
│   ├── pipeline.sh                   # Script principal da pipeline
│   ├── steps                         # Etapas da pipeline
│   │   ├── build-quarkus.sh
│   │   ├── deploy-des.sh
│   │   ├── deploy-prd.sh
│   │   ├── kubernetes-deploy.sh
│   │   ├── publish-registry.sh
│   │   └── settup-enviroment.sh
│   └── utils
│       └── replace-tokens.sh        # Substituição dinâmica de tokens nos YAMLs
├── make                              # Scripts auxiliares para automação
│   ├── kube-create.sh
│   ├── make.sh
│   ├── minikube-init.sh
│   ├── minikube-restart.sh
│   ├── registry-down.sh
│   ├── registry-up.sh
│   ├── run-jar.sh
│   ├── run-pipeline.sh
│   └── run-pipelineit.sh
├── Dockerfile.quar                   # Dockerfile para build da aplicação Quarkus
├── README.md                         # Documentação do projeto
├── mvnw                              # Wrapper Maven (Linux)
├── mvnw.cmd                          # Wrapper Maven (Windows)
├── pom.xml                           # Configuração do projeto Maven
└── src                               # Código fonte da aplicação Quarkus
    ├── main
    │   └── ...
    └── test
        └── ...


make/                        # Scripts para orquestrar etapas da pipeline
├── make.sh                  # Script principal para subir o ambiente e executar a pipeline
├── registry-up.sh           # Sobe o registry privado com IP fixo
├── minikube-init.sh         # Inicia o Minikube com configurações adequadas
├── run-pipeline.sh          # Executa build, tag e push da aplicação para o registry
├── kube-create.sh           # Aplica os manifests Kubernetes no cluster
local-pipelines/
├── k8s/                     # Arquivos de namespace, deployment e service com placeholders
├── utils/replace-tokens.sh  # Utilitário para substituir tokens nos YAMLs
```

---

## 🚀 Execução da Pipeline

### ✅ Etapa única com o script `make.sh`

No terminal (WSL2 recomendado):

```bash
export KUBE_PATH="/mnt/c/Users/<SEU_USUARIO>/.kube"
bash make/make.sh
```

---

### 📜 Etapas separadas (debug ou execução manual)

1. **Subir registry local e rede docker customizada**:

   ```bash
   bash make/registry-up.sh
   ```

2. **Iniciar o Minikube e configurá-lo para usar o registry local**:

   ```bash
   bash make/minikube-init.sh
   ```

3. **Executar o runner para buildar a aplicação Quarkus e publicar no registry**:

   ```bash
   bash make/run-pipeline.sh
   ```

4. **Aplicar os manifests no cluster (namespace, deployment e service)**:

   ```bash
   bash make/kube-create.sh
   ```

---

## 🧪 Acessando a aplicação

### Após rodar o `kube-create.sh`, você pode acessar:

#### 🔹 Via `minikube service`:

```bash
minikube service getting-started-service -n ns-getting-started-des
```

> ⚠️ Se este comando falhar com erro de múltiplos IPs, altere o service para `LoadBalancer` e rode:

```bash
minikube tunnel
```

A aplicação estará disponível em:

```
http://127.0.0.1:8080/hello
```

---

## 🛠️ Problemas comuns

### ❌ `Error: unable to read client-cert ...`

Seu `kubectl` no container runner está tentando usar caminhos Windows no `config`.
✅ **Solução**: monte os diretórios `.kube` e `.minikube` no container e ajuste os paths no `config`.

```bash
-v /mnt/c/Users/<SEU_USER>/.kube:/root/.kube:ro
-v /mnt/c/Users/<SEU_USER>/.minikube:/root/.minikube:ro
```

---

## 💡 Dicas avançadas

* Se quiser rodar os scripts `make/*.sh` fora do WSL2 (ex: Git Bash), ajuste os paths e permissões.
* A arquitetura suporta fácil expansão para CI/CD real (GitHub Actions, GitLab Runner, etc).
* Você pode usar `minikube mount` ou `docker cp` se quiser copiar arquivos sem montar volumes.

---

## 📚 Referências úteis

* 📘 [Documentação do Quarkus](https://quarkus.io/guides/)
* 📘 [Documentação oficial do Minikube](https://minikube.sigs.k8s.io/docs/)
* 📘 [kubectl cheatsheet](https://kubernetes.io/docs/reference/kubectl/cheatsheet/)
* 📘 [Docker Networking](https://docs.docker.com/network/bridge/)

---