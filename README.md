# CHR

CHR(Command History Report): A command history report tool base on your shell history file.

> Your data is yours.

[![Hex.pm version](https://img.shields.io/hexpm/v/chr.svg)](https://hex.pm/packages/chr)
[![Twitter: ThaddeusJiang](https://img.shields.io/twitter/follow/ThaddeusJiang.svg?style=social)](https://twitter.com/ThaddeusJiang)

> Inspired by the Fig report, this tool aims to provide a similar experience for those not using Fig.

![Fig 2022 Wrapped](https://pbs.twimg.com/media/FkqSV8hXoAEXqON?format=png&name=small)

## Features

- 🏆Top Commands
- 📂Top Directories
- 💦Busiest Day
- 📅Weekly Activity
- 🕙Daily Activity

## Requirements

- [Elixir](https://elixir-lang.org/install.html)

```sh
brew install elixir
```

## Usage

```sh
mix escript.install hex chr

chr
```

## Report Example

```
┌─────────────────────────────────────────────────────────────┐
│                                                             │
│  ███████╗    ██╗  ██╗    ██████╗                            │
│  ██╔════╝    ██║  ██║    ██╔══██╗                           │
│  ██║         ███████║    ██████╔╝                           │
│  ██║         ██╔══██║    ██╔══██╗                           │
│  ╚██████╗    ██║  ██║    ██║  ██║                           │
│   ╚═════╝    ╚═╝  ╚═╝    ╚═╝  ╚═╝  Commands History Report  │
│                                                             │
│  Made with ❤️ by ThaddeusJiang                               │
│  source code: https://github.com/ThaddeusJiang/chr          │
│                                                             │
└─────────────────────────────────────────────────────────────┘
┌─🏆 Top Commands────┐
│                    │
│  810 git           │
│  276 cd            │
│  183 code          │
│  150 mix           │
│  111 ls            │
│  93 clear          │
│  63 docker         │
│  59 npm            │
│  49 k6             │
│  45 ./gitlab_cli   │
│                    │
└────────────────────┘
┌─📂 Top Directories──────────┐
│                             │
│  36 git/work/plugo          │
│  24 repos/backend           │
│  16 repos/roaming-gateway   │
│  14 git/ThaddeusJiang       │
│  13 repos/k8s               │
│                             │
└─────────────────────────────┘
┌─💦 Busiest Day───────────────┐
│                              │
│  372 commands on 2024-02-19  │
│                              │
└──────────────────────────────┘
┌─📅 Weekly Activity─────────┐
│                            │
│  Mon                       │
│  Tue ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓  │
│  Wed ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓      │
│  Thu ▓▓▓▓▓▓▓               │
│  Fri ▓▓▓▓▓▓▓▓▓▓▓           │
│  Sat ▓▓▓▓▓▓▓▓▓▓            │
│  Sun ▓                     │
│                            │
└────────────────────────────┘
┌─🕑 Daily Activity─────────┐
│                           │
│  01                       │
│  02                       │
│  03                       │
│  04                       │
│  05 ▓                     │
│  06 ▓▓                    │
│  07 ▓                     │
│  08                       │
│  09                       │
│  10 ▓                     │
│  11 ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓  │
│  12 ▓▓▓▓▓▓▓▓▓▓            │
│  13 ▓▓▓▓▓▓▓▓▓▓▓           │
│  14 ▓▓▓▓▓▓▓▓▓             │
│  15 ▓▓▓▓▓▓▓▓▓▓▓▓▓         │
│  16 ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓   │
│  17 ▓▓▓▓▓▓▓▓▓▓            │
│  18 ▓▓▓▓▓▓▓▓▓▓▓▓          │
│  19 ▓▓▓▓▓▓▓▓              │
│  20 ▓▓▓▓▓▓▓▓▓▓▓           │
│  21 ▓▓▓▓▓▓▓               │
│  22 ▓▓▓▓▓▓                │
│  23 ▓▓▓▓▓                 │
│  24 ▓                     │
│                           │
└───────────────────────────┘
```

## Author

👤 **Thaddeus Jiang**

- Website: https://thaddeusjiang.com/
- Twitter: [@ThaddeusJiang](https://twitter.com/ThaddeusJiang)
- Github: [@ThaddeusJiang](https://github.com/ThaddeusJiang)

## Acknowledgement

This has been possible due to the previous work of numerous people. In particular:

- @borkdude - Author of babashka, thanks for helping me remove the manual data preparation requirement

## Show your support

Give a ⭐️ if this project helped you!

---

_This README was generated with ❤️ by [readme-md-generator](https://github.com/kefranabg/readme-md-generator)_
