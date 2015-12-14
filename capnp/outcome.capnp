using Go = import "go.capnp";

$Go.package("capnp");
$Go.import("goshawkdb.io/common/capnp");

@0xe10cac715301f488;

using Txn = import "transaction.capnp";
using Vec = import "vectorclock.capnp";

struct Outcome {
  id  @0: List(OutcomeId);
  txn @1: Txn.Txn;
  union {
    commit       @2: Vec.VectorClock;
    abort :group {
      union {
        resubmit @3: Void;
        rerun    @4: List(Update);
      }
    }
  }
}

struct Update {
  txnId   @0: Data;
  actions @1: List(Txn.Action);
  clock   @2: Vec.VectorClock;
}

struct OutcomeId {
  varId             @0: Data;
  acceptedInstances @1: List(AcceptedInstanceId);
}

struct AcceptedInstanceId {
  rmId @0: UInt32;
  vote @1: VoteEnum;
}

enum VoteEnum {
  commit        @0;
  abortBadRead  @1;
  abortDeadlock @2;
}
