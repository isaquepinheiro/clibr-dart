<p align="center">DMFBr Framework for Delphi, para construção de aplicativos eficientes e escaláveis.</p>
<p align="center">
  <img src="assets/cli.jfif" alt="super CLI" width="100%">
</p>

# Description
O DMFBr CLI é uma ferramenta de linha de comando que ajuda a inicializar, desenvolver e manter suas aplicações que usa o DMFBr. Ele auxilia de várias maneiras, incluindo a criação da estrutura básica do projeto. Ele incorpora padrões arquiteturais de boas práticas para incentivar a criação de aplicativos bem estruturados.

### Getting started

Installation:
 * Download [setup](https://github.com/isaquepinheiro/dmfbr_cli/releases)
 * Just type `dmfbr` in cmd
 
## Available Commands

### > New
This command initialize a new project.
```
dmfbr new app my_api
```
###### Aliases: n

### > Informations
This command show the client informations
```
dmfbr info
```
###### Aliases: i

### > Version
This command show the client version
```
dmfbr --version
```
###### Aliases: -v

## Flags

### > --vcl --horse, --guard 
This flag defines new project partner Horse or vcl
```
dmfbr new app my_api --horse
dmfbr new app my_api --vcl
```
### > Help
This is a helper for dmfbr. Use `dmfbr <command> --help` for more information about a command.
```
dmfbr --help
```
###### Aliases: -h

## Another commands
```
generate           Generate files handler/module/controller/service
```
###### Aliases: g

## Samples
```
dmfbr g module product
dmfbr g controller product
dmfbr g service product
```


