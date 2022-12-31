# CLI Report

I like Fig report, but I don't use Fig currently.😅

So, I want to make a same report for myself.

![Fig 2022 Wrapped](https://pbs.twimg.com/media/FkqSV8hXoAEXqON?format=png&name=small)

## Required

installed [babashka](https://github.com/babashka/babashka)

```bash
$ bash < <(curl -s https://raw.githubusercontent.com/babashka/babashka/master/install)
```

## Usage

```bash
// prepare data
$ history -i | awk '{print $2,$3,$4,$5,$1}'  > input.txt

$ bb report.clj
```

result:

```
Total: 10125

🏆Top 10 commands
  3167 git
  1661 yarn
  1595 cd
   663 ls
   568 code
   214 docker
   178 exit
   152 mv
   139 rm
   136 docker-compose

📂Top 10 directories
    54 git/work/kyuyo/kyuyo-docs
    52 git/work/kyuyo/kyuyo-codes
    46 git/work/romu/romu-styleguide/apps/romu-frontend-core
    34 git/personal
    32 git/personal/codes/omakase-ui
    29 git/work/romu/romu-frontend-root
    27 git/personal/codes
    25 git/work/romu/romu-docs
    21 packages/react-table
    20 codes

💦The busiest day
   402 commands on 2022-12-19

🕙Daily Activity
   00:00
   04:00
   05:00
   07:00
   08:00
   09:00 ██
   10:00 ███████████
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
   23:00 ██
```
