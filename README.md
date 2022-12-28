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
$ history > history.txt

$ bb report.clj
```

result:

```
--top 10 commands--

git 3140
yarn 1661
cd 1586
ls 654
code 564
docker 214
exit 178
mv 152
rm 138
docker-compose 136

--total-- 10022
```
