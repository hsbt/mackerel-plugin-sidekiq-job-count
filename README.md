# mackerel-plugin-sidekiq-job-count

sidekiq job counts for mackerel plugin

## Example Usage

example configuration of `mackerel-agent.conf`

```
[plugin.metrics.sidekiq_job_count]
command = "/usr/local/bin/mackerel-plugin-sidekiq-job-count your_redisserver.com 6379 sidekiq"
```
