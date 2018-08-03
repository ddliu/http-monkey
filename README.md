# HTTP-MONKEY

Continuous HTTP request for network simulation.

## Usage

```
docker run --rm ddliu/http-monkey https://www.google.com https://www.github.com
```

## Environment variables

- SLEEP: Seconds to sleep every request round
- USERAGENT: User agent to send as header