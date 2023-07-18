<p align="center">ModularBr Framework for Delphi, para construção de aplicativos eficientes e escaláveis.</p>
<p align="center">
  <img src="assets/cli.jfif" alt="super CLI" width="100%">
</p>

# Description
O CLIBr é uma ferramenta de linha de comando que ajuda a inicializar, desenvolver e manter suas aplicações que usa o ModularBr. Ele auxilia de várias maneiras, incluindo a criação da estrutura básica do projeto. Ele incorpora padrões arquiteturais de boas práticas para incentivar a criação de aplicativos bem estruturados.

### Getting started

Installation:
 * Download [setup](https://github.com/isaquepinheiro/clibr/releases)
 * Just type `clibr` in cmd
 
## Available Commands

### > New
This command initialize a new project.
```
clibr new app my_api
```
###### Aliases: n

### > Informations
This command show the client informations
```
clibr info
```
###### Aliases: i

### > Version
This command show the client version
```
clibr --version
```
###### Aliases: -v

## Flags

### > --vcl --horse, --guard 
This flag defines new project partner Horse or VCL
```
clibr new app my_api --horse
clibr new app my_api --vcl
```
### > Help
This is a helper for clibr. Use `clibr <command> --help` for more information about a command.
```
clibr --help
```
###### Aliases: -h

## Another commands
```
generate           Generate files handler/module/controller/service
```
###### Aliases: g

## Samples
```
clibr g module product
clibr g controller product
clibr g service product
```


