# CHR

The native commands history report for the default terminal users.

[![bb compatible](https://raw.githubusercontent.com/babashka/babashka/master/logo/badge.svg)](https://babashka.org)
[![Twitter: ThaddeusJiang](https://img.shields.io/twitter/follow/ThaddeusJiang.svg?style=social)](https://twitter.com/ThaddeusJiang)

> The name "CHR" is derived from `commands history report`.

> I like Fig report, but I don't use Fig currently.😅
> So, I want to make a same report for myself.

![Fig 2022 Wrapped](https://pbs.twimg.com/media/FkqSV8hXoAEXqON?format=png&name=small)

## Features

- 🏆Top Commands
- 📂Top Directories
- 💦Busiest Day
- 📅Weekly Activity
- 🕙Daily Activity

## Usage

```bash
$ bbin install https://raw.githubusercontent.com/ThaddeusJiang/chr/main/chr.clj

$ chr
```

If you don't use [bbin](https://github.com/babashka/bbin), you have to install [babashka](https://github.com/babashka/babashka) first.

```bash
$ bash < <(curl -s https://raw.githubusercontent.com/babashka/babashka/master/install)
```

```bash
$ git clone https://github.com/ThaddeusJiang/chr.git chr && cd $_
$ bb chr.clj

// or

$ bb -e '(load-string (slurp "https://raw.githubusercontent.com/ThaddeusJiang/chr/main/chr.clj"))'
```

result:

```
Total: 10017

🏆Top 10 commands
  3065 git
  1597 yarn
  1530 cd
   647 ls
   550 code
   219 docker
   176 exit
   153 mv
   140 rm
   137 clear

📂Top 10 directories
    55 git/work/kyuyo/kyuyo-docs
    54 git/work/kyuyo/kyuyo-codes
    39 git/work/romu/romu-styleguide/apps/romu-frontend-core
    34 git/personal
    31 git/personal/codes/omakase-ui
    27 git/personal/codes
    22 git/work/romu/romu-docs
    22 git/work/romu/romu-frontend-root
    19 kyuyo-codes
    19 codes

💦The busiest day
   402 commands on 2022-12-19

📅Weekly Activity
    Sunday ████
    Monday ███████████████████████
   Tuesday ████████████████
 Wednesday ████████████████████
  Thursday █████████████████
    Friday █████████████
  Saturday ███

🕙Daily Activity
    00:00
    04:00
    05:00
    07:00
    08:00
    09:00 ██
    10:00 ██████████
    11:00 ███████
    12:00 ██
    13:00 ███████
    14:00 ██████████
    15:00 ████████
    16:00 ████████
    17:00 ████████
    18:00 ████████
    19:00 ███
    20:00 ██
    21:00 ███████
    22:00 ███████
    23:00 ███
```

## Author

👤 **Thaddeus Jiang**

- Website: https://thaddeusjiang.com/
- Twitter: [@ThaddeusJiang](https://twitter.com/ThaddeusJiang)
- Github: [@ThaddeusJiang](https://github.com/ThaddeusJiang)

## Thanks and Acknowledgements

This has been possible due to the previous work of numerous people. In particular:

- @borkdude - Author of babashka, thanks for helping me remove the manual data preparation requirement

## Show your support

Give a ⭐️ if this project helped you!

---

_This README was generated with ❤️ by [readme-md-generator](https://github.com/kefranabg/readme-md-generator)_
