# ha-3proxy

A Home Assistant add-on running [3proxy](https://github.com/3proxy/3proxy) as
a SOCKS5 proxy.

## Installation

Add `https://github.com/juliusmh/ha-3proxy` under Settings → Add-ons →
Add-on store → ⋮ → Repositories, then install **3proxy**.

## Options

| Option            | Default                      | Description                                  |
| ----------------- | ---------------------------- | -------------------------------------------- |
| `listen`          | `0.0.0.0`                    | Address to listen on.                        |
| `port`            | `1080`                       | Port to listen on.                           |
| `username`        |                              | Required.                                    |
| `password`        |                              | Required; no spaces or double quotes.        |
| `allowed_sources` | `100.64.0.0/10`, `127.0.0.1` | IPv4 addresses or ranges clients may use the proxy from; `0.0.0.0/0` for any. |

The add-on uses the host network, so with `0.0.0.0` it listens on every
address of the host. By default only Tailscale clients and the host itself
may use it; add your LAN's range to `allowed_sources` to allow it too. Binding
to the Tailscale IP doesn't work: connections to it are refused.

## Usage

```sh
curl -x socks5h://<username>:<password>@<host>:1080 https://example.com
```

## License

The files in this repository are licensed under the MIT License:

Copyright (c) 2026 Julius Hinze

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

3proxy itself is not part of this repository. The add-on takes its binary from
the official [`3proxy/3proxy`](https://hub.docker.com/r/3proxy/3proxy) image
when it is built. 3proxy is © 3APA3A, 3proxy.org and Vladimir Dubrovin, and
is distributed under its own BSD-style license; see its
[`copying`](https://github.com/3proxy/3proxy/blob/master/copying) file.
