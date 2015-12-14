using Go = import "go.capnp";

$Go.package("capnp");
$Go.import("goshawkdb.io/common/capnp");

@0x960e5f709149380d;

using VC = import "vectorclock.capnp";
using Txn = import "transaction.capnp";

struct Ballot {
  varId @0: Data;
  clock @1: VC.VectorClock;
  vote  @2: Vote;
}

struct Vote {
  union {
    commit                @0: Void;
    abortBadRead :group {
      txnId      @1: Data;
      txnActions @2: List(Txn.Action);
    }
    abortDeadlock         @3: Void;
  }
}
