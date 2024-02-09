# CHR

The commands history report CLI for the Elixir developers.

[![Twitter: ThaddeusJiang](https://img.shields.io/twitter/follow/ThaddeusJiang.svg?style=social)](https://twitter.com/ThaddeusJiang)

> The name "chr" is derived from "commands history report".
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
┌─Top Commands────┐
│                 │
│  496 git        │
│  200 cd         │
│  110 code       │
│  75 ls          │
│  48 clear       │
│  48 mix         │
│  46 docker      │
│  32 ./chr       │
│  30 npm         │
│  27 erl         │
│                 │
└─────────────────┘
┌─Top Directories─────────────┐
│                             │
│  24 git/work/plugo          │
│  16 repos/roaming-gateway   │
│  15 repos/backend           │
│  11 repos/k8s               │
│  10 git/ThaddeusJiang       │
│                             │
└─────────────────────────────┘
┌─Busiest Day──────────────────┐
│                              │
│  274 commands on 2024-02-08  │
│                              │
└──────────────────────────────┘
┌─Weekly Activity────────────┐
│                            │
│  Mon                       │
│  Tue ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓   │
│  Wed ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓  │
│  Thu ▓▓▓▓▓▓▓▓▓             │
│  Fri ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓   │
│  Sat ▓▓▓▓▓▓▓▓▓▓▓           │
│  Sun                       │
│                            │
└────────────────────────────┘
┌─Daily Activity────────────┐
│                           │
│  01                       │
│  02                       │
│  03                       │
│  04                       │
│  05                       │
│  06                       │
│  07                       │
│  08                       │
│  09                       │
│  10 ▓                     │
│  11 ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓     │
│  12 ▓▓▓▓▓▓▓▓              │
│  13 ▓▓▓▓▓▓▓▓▓▓▓▓          │
│  14 ▓▓▓▓▓▓▓               │
│  15 ▓▓▓▓▓▓▓▓▓▓▓▓▓▓        │
│  16 ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓  │
│  17 ▓▓▓▓▓▓▓▓              │
│  18 ▓▓▓▓▓▓▓▓              │
│  19 ▓▓▓▓▓▓▓               │
│  20 ▓▓▓▓▓                 │
│  21 ▓▓▓▓▓▓▓               │
│  22 ▓▓▓▓▓▓▓               │
│  23 ▓▓▓▓                  │
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
