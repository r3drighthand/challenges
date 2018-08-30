def benchmark
  start_time = Time.now
  yield
  end_time = Time.now
  total_run_time = end_time - start_time
end