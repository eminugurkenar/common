using Go = import "go.capnp";

$Go.package("capnp");
$Go.import("goshawkdb.io/common/capnp");

@0xbbc717d787db5c5f;

struct Topology {
  clusterId          @0: Text;
  version            @1: UInt32;
  hosts              @2: List(Text);
  f                  @3: UInt8;
  maxRMCount         @4: UInt8;
  asyncFlush         @5: Bool;
  rms                @6: List(UInt32);
  fingerprints       @7: List(Data);
}
