# sopick

## Setup

```
$ cp frontend/src/.env.default frontend/src/.env && cp .env.default .env && cp api/src/.env.default api/src/.env
$ docker-compose build
$ docker-compose exec api bundle install
$ docker-compose up
```

## gemの追加

```
docker-compose run --rm rails bundle install
```

- API -> http://localhost:3031
- Database -> http://localhost:3033
- Swagger -> http://localhost:3039
- StoryBook -> http://localhost:6006/

## migrate使い方

```
docker-compose exec api bundle exec rails db:migrate:status
docker-compose exec api bundle exec rails db:migrate:reset
docker-compose exec api bundle exec rails db:rollback 
docker-compose exec api bundle exec rails db:migrate:down VERSION={timestamp}
docker-compose exec api bundle exec rails db:migrate 
```

## バッチジョブの実行方法

```
docker-compose exec api bundle exec rails runner "Assets::Scraping::ScrapingActor.new.scrapingActorsDiary('hokkaido', 'SOAP')"
```

## TroubleShoot
各エラーメッセージが出た時の対処

### Run `bundle install` to install missing gems.

```
$ docker volume ls 
$ docker volume rm sopick_bundle 
```

## API

### Test

```
全テストを実行
$ docker-compose run --rm api bundle exec rspec

指定したテストを実行
$ docker-compose run --rm api bundle exec rspec -e [describe]
```

### Lint

以下のコマンドで静的解析を実行します。

```
$ docker-compose run --rm api bundle exec rubocop
```

## License

MIT
