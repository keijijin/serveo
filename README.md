# Serveo URL Monitor

This shell script monitors the IP address of a Serveo URL and sends an email notification whenever the IP address changes. It also establishes a reverse SSH tunnel to forward a local port to a remote port using Serveo.

## Prerequisites

- `curl` command-line tool
- `sendmail` command-line tool
- `ssh` command-line tool

## Usage

```shell
$ ./serveo-url-monitor.sh LOCAL_HOST LOCAL_PORT
```

- `LOCAL_HOST`: The local host to forward the traffic from.
- `LOCAL_PORT`: The local port to forward the traffic from.

## Configuration

Before running the script, make sure to configure the following variables:

- `TO_EMAIL`: The email address where notifications will be sent.
- `SUBJECT`: The subject of the email notification.
- `FROM_EMAIL`: The email address used as the sender.

## How it works

1. The script retrieves the current IP address using the `curl` command and the `http://ifconfig.me` API.
2. It compares the current IP address with the last recorded IP address.
3. If the IP addresses differ, an email notification is sent to the specified email address using the `sendmail` command.
4. The last recorded IP address is updated with the current IP address.
5. The script establishes a reverse SSH tunnel using the `ssh` command, forwarding the local port to the remote port on Serveo.
6. If the connection to Serveo is lost, the script waits for 10 seconds and then attempts to reconnect.

Note: The script assumes that you have SSH access to Serveo and have set up the necessary SSH keys or authentication method.
