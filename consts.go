package common

import (
	"time"
)

const (
	DefaultPort          = 7894
	ProductVersion       = "0.3" // protocol version!
	ProductName          = "GoshawkDB"
	HeartbeatInterval    = 2 * time.Second
	ConnectionBufferSize = 131072
)

var (
	VersionZero = MakeTxnId([]byte{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0})
)
