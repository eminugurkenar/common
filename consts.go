package common

import (
	"time"
)

const (
	DefaultPort          = 7894
	DefaultWSSPort       = 7895
	ProductVersion       = "dev" // protocol version!
	ProductName          = "GoshawkDB"
	HeartbeatInterval    = 2 * time.Second
	ConnectionBufferSize = 1048576
)

var (
	VersionZero = MakeTxnId([]byte{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0})
)
