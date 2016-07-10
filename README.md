# exercicio_dinda
Teste para o processo seletivo na empresa Dinda:

Programa de linha de comando para calcular o balanço da conta corrente de um conjunto de clientes.


O software desenvolvido em Objective-C e C, e foi tratado com NSAssert, parando a execução do sistema caso haja algum erro. 

Os arquivos `conta.csv` e `transacoes.csv` estão inclusos na pasta `Assets` para testes. 

## Dependencias

* Xcode
* Command Line Tools

## Rodando o projeto

Para rodar o projeto basta excutar o `Dinda.xcodeproj` e clicar em run, que o programa será executado, pedindo para o usuário indicar o caminho dos arquivos `conta.csv` e `transacoes.csv`

O usuário também poderá executar o programa, achando a pasta que foi compilado, entrar na pasta `Build -> Products -> Debug` e executar o comando:
        
    ./Dinda /path/to/file/contas.csv /path/to/file/transacoes.csv
