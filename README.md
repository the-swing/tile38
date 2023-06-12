## Tile38
싫시간 위치정보서버에 필요한 Tile38 입니다.

### 빌드 & 푸쉬 방법
```agsl
./scripts/build.sh tile38-cli
./scripts/build.sh tile38-server
./scripts/build.sh tile38-benchmark
./scripts/package.sh linux linux amd64
./scripts/build-push.sh
```

그럼
> 561760315420.dkr.ecr.ap-northeast-2.amazonaws.com/livecoord/tile38

요기에 올라갑니다!
그럼 Task Definition 을 수정하시면 됩니다!

감사합니다.