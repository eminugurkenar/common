using Go = import "go.capnp";

$Go.package("capnp");
$Go.import("goshawkdb.io/common/capnp");

@0xbc29bdc7c3fbad47;

using Var = import "var.capnp";

struct Txn {
  id                 @0: Data;
  submitter          @1: UInt32;
  submitterBootCount @2: UInt32;
  retry              @3: Bool;
  actions            @4: List(Action);
  allocations        @5: List(Allocation);
  fInc               @6: UInt8;
  topologyVersion    @7: UInt32;
}

struct Action {
  varId      @0: Data;
  union {
    read :group {
      version    @1: Data;
    }
    write :group {
      value      @2: Data;
      references @3: List(Var.VarIdPos);
    }
    readwrite :group {
      version    @4: Data;
      value      @5: Data;
      references @6: List(Var.VarIdPos);
    }
    create :group {
      positions  @7: List(UInt8);
      value      @8: Data;
      references @9: List(Var.VarIdPos);
    }
    missing      @10: Void;
    roll :group {
      version    @11: Data;
      value      @12: Data;
      references @13: List(Var.VarIdPos);
    }
  }
}

struct Allocation {
  rmId          @0: UInt32;
  actionIndices @1: List(UInt16);
  active        @2: UInt32;
}
