import { InfluxDB } from '@influxdata/influxdb-client';

const url = 'http://influxdb:8086';
const token = 'speedtest123!';
const org = 'speedtest';

const client = new InfluxDB({ url, token }).getQueryApi(org);
const fluxQuery =
  'from(bucket:"speedtests") |> range(start:-1d) |> filter(fn: (r) => r["_measurement"] == "mbps") |> filter(fn: (r) => r["_field"] == "download")';
const fluxQueryMean =
  'from(bucket:"speedtests") |> range(start:-1d) |> filter(fn: (r) => r["_measurement"] == "mbps") |> filter(fn: (r) => r["_field"] == "download") |> mean(column: "_value")';

client.queryRows(fluxQuery, {
  next: (row, tableMeta) => {
    const tableObject = tableMeta.toObject(row);
    console.log(tableObject);
  },
  error: (error) => {
    console.error('\nError', error);
  },
  complete: () => {
    console.log('\nSuccess');
  },
});

client.queryRows(fluxQueryMean, {
  next: (row, tableMeta) => {
    const tableObject = tableMeta.toObject(row);
    console.log(tableObject);
  },
  error: (error) => {
    console.error('\nError', error);
  },
  complete: () => {
    console.log('\nSuccess');
  },
});
