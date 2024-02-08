# chr

The commands history report command for the default terminal users.

> The name "chr" is derived from `commands history report`.

[![Twitter: ThaddeusJiang](https://img.shields.io/twitter/follow/ThaddeusJiang.svg?style=social)](https://twitter.com/ThaddeusJiang)

> I like Fig report, but I don't use Fig currently.😅
> So, I want to make a same report for myself.

![Fig 2022 Wrapped](https://pbs.twimg.com/media/FkqSV8hXoAEXqON?format=png&name=small)

## Features

- 🏆Top Commands
- 📂Top Directories
- 💦Busiest Day
- 📅Weekly Activity
- 🕙Daily Activity

## Requirements

- [Erlang](https://www.erlang.org/) (>= 24.0)

```shell
brew install erlang
```

## Installation

```sh
mix escript.install hex chr
```

## Report Example

```
🏆Top Commands

git                     204
code                     31
clear                    10
ls                        9
./chr                     7
escript                   6
cat                       6
docker                    5
tiddlywiki                3
npx                       3

📂Top Directories

git/work/plugo            7
src/proto                 4
git/ThaddeusJiang/ch      4
../..                     4
git/ThaddeusJiang         3
git                       2
te-work-                  1
repos/roaming-gatewa      1
repos/proto               1
private-notes             1

💦Busiest Day

2024-01-29              206

📅Weekly Activity

Monday: ▓▓▓▓▓▓▓▓▓▓
Tuesday: ▓▓▓▓▓
Friday: ▓▓

🕙Daily Activity

10: ▓▓▓▓▓▓▓▓▓▓
11: ▓▓
12: ▓
13: ▓
14: ▓▓▓
15: ▓▓
16:
17:
18: ▓
19: ▓▓▓
20: ▓▓▓▓

👍Total commands           364
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
