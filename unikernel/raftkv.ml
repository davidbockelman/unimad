open Ocaml_protoc_plugin

(**/**)
module Runtime' = Ocaml_protoc_plugin [@@warning "-33"]
module Imported'modules = struct
end
(**/**)
module rec Raftkv : sig

  (** Messages *)
  module rec State : sig
    type t = {
    term: int;
    isLeader: bool;
    }[@@deriving show { with_path = false }]
    val make: ?term:int -> ?isLeader:bool -> unit -> t
    (** Helper function to generate a message using default values *)

    val to_proto: t -> Runtime'.Writer.t
    (** Serialize the message to binary format *)

    val from_proto: Runtime'.Reader.t -> (t, [> Runtime'.Result.error]) result
    (** Deserialize from binary format *)

    val to_json: Runtime'.Json_options.t -> t -> Runtime'.Json.t
    (** Serialize to Json (compatible with Yojson.Basic.t) *)

    val from_json: Runtime'.Json.t -> (t, [> Runtime'.Result.error]) result
    (** Deserialize from Json (compatible with Yojson.Basic.t) *)

    val name: unit -> string
    (** Fully qualified protobuf name of this message *)

    (**/**)
    type make_t = ?term:int -> ?isLeader:bool -> unit -> t
    val merge: t -> t -> t
    val to_proto': Runtime'.Writer.t -> t -> unit
    val from_proto_exn: Runtime'.Reader.t -> t
    val from_json_exn: Runtime'.Json.t -> t
    (**/**)
  end
  and KeyValue : sig
    type t = {
    key: string;
    value: string;
    clientId: int;
    requestId: int;
    }[@@deriving show { with_path = false }]
    val make: ?key:string -> ?value:string -> ?clientId:int -> ?requestId:int -> unit -> t
    (** Helper function to generate a message using default values *)

    val to_proto: t -> Runtime'.Writer.t
    (** Serialize the message to binary format *)

    val from_proto: Runtime'.Reader.t -> (t, [> Runtime'.Result.error]) result
    (** Deserialize from binary format *)

    val to_json: Runtime'.Json_options.t -> t -> Runtime'.Json.t
    (** Serialize to Json (compatible with Yojson.Basic.t) *)

    val from_json: Runtime'.Json.t -> (t, [> Runtime'.Result.error]) result
    (** Deserialize from Json (compatible with Yojson.Basic.t) *)

    val name: unit -> string
    (** Fully qualified protobuf name of this message *)

    (**/**)
    type make_t = ?key:string -> ?value:string -> ?clientId:int -> ?requestId:int -> unit -> t
    val merge: t -> t -> t
    val to_proto': Runtime'.Writer.t -> t -> unit
    val from_proto_exn: Runtime'.Reader.t -> t
    val from_json_exn: Runtime'.Json.t -> t
    (**/**)
  end
  and GetKey : sig
    type t = {
    key: string;
    clientId: int;
    requestId: int;
    }[@@deriving show { with_path = false }]
    val make: ?key:string -> ?clientId:int -> ?requestId:int -> unit -> t
    (** Helper function to generate a message using default values *)

    val to_proto: t -> Runtime'.Writer.t
    (** Serialize the message to binary format *)

    val from_proto: Runtime'.Reader.t -> (t, [> Runtime'.Result.error]) result
    (** Deserialize from binary format *)

    val to_json: Runtime'.Json_options.t -> t -> Runtime'.Json.t
    (** Serialize to Json (compatible with Yojson.Basic.t) *)

    val from_json: Runtime'.Json.t -> (t, [> Runtime'.Result.error]) result
    (** Deserialize from Json (compatible with Yojson.Basic.t) *)

    val name: unit -> string
    (** Fully qualified protobuf name of this message *)

    (**/**)
    type make_t = ?key:string -> ?clientId:int -> ?requestId:int -> unit -> t
    val merge: t -> t -> t
    val to_proto': Runtime'.Writer.t -> t -> unit
    val from_proto_exn: Runtime'.Reader.t -> t
    val from_json_exn: Runtime'.Json.t -> t
    (**/**)
  end
  and Reply : sig
    type t = {
    wrongLeader: bool;
    error: string;
    value: string;
    }[@@deriving show { with_path = false }]
    val make: ?wrongLeader:bool -> ?error:string -> ?value:string -> unit -> t
    (** Helper function to generate a message using default values *)

    val to_proto: t -> Runtime'.Writer.t
    (** Serialize the message to binary format *)

    val from_proto: Runtime'.Reader.t -> (t, [> Runtime'.Result.error]) result
    (** Deserialize from binary format *)

    val to_json: Runtime'.Json_options.t -> t -> Runtime'.Json.t
    (** Serialize to Json (compatible with Yojson.Basic.t) *)

    val from_json: Runtime'.Json.t -> (t, [> Runtime'.Result.error]) result
    (** Deserialize from Json (compatible with Yojson.Basic.t) *)

    val name: unit -> string
    (** Fully qualified protobuf name of this message *)

    (**/**)
    type make_t = ?wrongLeader:bool -> ?error:string -> ?value:string -> unit -> t
    val merge: t -> t -> t
    val to_proto': Runtime'.Writer.t -> t -> unit
    val from_proto_exn: Runtime'.Reader.t -> t
    val from_json_exn: Runtime'.Json.t -> t
    (**/**)
  end
  and Empty : sig
    type t = unit[@@deriving show { with_path = false }]
    val make: unit -> t
    (** Helper function to generate a message using default values *)

    val to_proto: t -> Runtime'.Writer.t
    (** Serialize the message to binary format *)

    val from_proto: Runtime'.Reader.t -> (t, [> Runtime'.Result.error]) result
    (** Deserialize from binary format *)

    val to_json: Runtime'.Json_options.t -> t -> Runtime'.Json.t
    (** Serialize to Json (compatible with Yojson.Basic.t) *)

    val from_json: Runtime'.Json.t -> (t, [> Runtime'.Result.error]) result
    (** Deserialize from Json (compatible with Yojson.Basic.t) *)

    val name: unit -> string
    (** Fully qualified protobuf name of this message *)

    (**/**)
    type make_t = unit -> t
    val merge: t -> t -> t
    val to_proto': Runtime'.Writer.t -> t -> unit
    val from_proto_exn: Runtime'.Reader.t -> t
    val from_json_exn: Runtime'.Json.t -> t
    (**/**)
  end
  and IntegerArg : sig
    type t = (int)[@@deriving show { with_path = false }]
    val make: ?arg:int -> unit -> t
    (** Helper function to generate a message using default values *)

    val to_proto: t -> Runtime'.Writer.t
    (** Serialize the message to binary format *)

    val from_proto: Runtime'.Reader.t -> (t, [> Runtime'.Result.error]) result
    (** Deserialize from binary format *)

    val to_json: Runtime'.Json_options.t -> t -> Runtime'.Json.t
    (** Serialize to Json (compatible with Yojson.Basic.t) *)

    val from_json: Runtime'.Json.t -> (t, [> Runtime'.Result.error]) result
    (** Deserialize from Json (compatible with Yojson.Basic.t) *)

    val name: unit -> string
    (** Fully qualified protobuf name of this message *)

    (**/**)
    type make_t = ?arg:int -> unit -> t
    val merge: t -> t -> t
    val to_proto': Runtime'.Writer.t -> t -> unit
    val from_proto_exn: Runtime'.Reader.t -> t
    val from_json_exn: Runtime'.Json.t -> t
    (**/**)
  end

  (** The RequestVoteRPC message for requesting votes from other nodes *)
  and RequestVoteRequest : sig
    type t = {
    candidate_id: int;(** ID of the candidate requesting the vote *)
    term: int;(** Term number of the candidate *)
    last_log_index: int;(** Index of the last log entry of the candidate *)
    last_log_term: int;(** Term of the last log entry of the candidate *)
    }[@@deriving show { with_path = false }]
    val make: ?candidate_id:int -> ?term:int -> ?last_log_index:int -> ?last_log_term:int -> unit -> t
    (** Helper function to generate a message using default values *)

    val to_proto: t -> Runtime'.Writer.t
    (** Serialize the message to binary format *)

    val from_proto: Runtime'.Reader.t -> (t, [> Runtime'.Result.error]) result
    (** Deserialize from binary format *)

    val to_json: Runtime'.Json_options.t -> t -> Runtime'.Json.t
    (** Serialize to Json (compatible with Yojson.Basic.t) *)

    val from_json: Runtime'.Json.t -> (t, [> Runtime'.Result.error]) result
    (** Deserialize from Json (compatible with Yojson.Basic.t) *)

    val name: unit -> string
    (** Fully qualified protobuf name of this message *)

    (**/**)
    type make_t = ?candidate_id:int -> ?term:int -> ?last_log_index:int -> ?last_log_term:int -> unit -> t
    val merge: t -> t -> t
    val to_proto': Runtime'.Writer.t -> t -> unit
    val from_proto_exn: Runtime'.Reader.t -> t
    val from_json_exn: Runtime'.Json.t -> t
    (**/**)
  end

  (** The response message for RequestVoteRPC *)
  and RequestVoteResponse : sig
    type t = {
    vote_granted: bool;(** Whether the vote is granted or not *)
    term: int;(** Current term of the receiver *)
    }[@@deriving show { with_path = false }]
    val make: ?vote_granted:bool -> ?term:int -> unit -> t
    (** Helper function to generate a message using default values *)

    val to_proto: t -> Runtime'.Writer.t
    (** Serialize the message to binary format *)

    val from_proto: Runtime'.Reader.t -> (t, [> Runtime'.Result.error]) result
    (** Deserialize from binary format *)

    val to_json: Runtime'.Json_options.t -> t -> Runtime'.Json.t
    (** Serialize to Json (compatible with Yojson.Basic.t) *)

    val from_json: Runtime'.Json.t -> (t, [> Runtime'.Result.error]) result
    (** Deserialize from Json (compatible with Yojson.Basic.t) *)

    val name: unit -> string
    (** Fully qualified protobuf name of this message *)

    (**/**)
    type make_t = ?vote_granted:bool -> ?term:int -> unit -> t
    val merge: t -> t -> t
    val to_proto': Runtime'.Writer.t -> t -> unit
    val from_proto_exn: Runtime'.Reader.t -> t
    val from_json_exn: Runtime'.Json.t -> t
    (**/**)
  end
  and LogEntry : sig
    type t = {
    index: int;
    term: int;
    command: string;(** Represents a command or data in the entry *)
    }[@@deriving show { with_path = false }]
    val make: ?index:int -> ?term:int -> ?command:string -> unit -> t
    (** Helper function to generate a message using default values *)

    val to_proto: t -> Runtime'.Writer.t
    (** Serialize the message to binary format *)

    val from_proto: Runtime'.Reader.t -> (t, [> Runtime'.Result.error]) result
    (** Deserialize from binary format *)

    val to_json: Runtime'.Json_options.t -> t -> Runtime'.Json.t
    (** Serialize to Json (compatible with Yojson.Basic.t) *)

    val from_json: Runtime'.Json.t -> (t, [> Runtime'.Result.error]) result
    (** Deserialize from Json (compatible with Yojson.Basic.t) *)

    val name: unit -> string
    (** Fully qualified protobuf name of this message *)

    (**/**)
    type make_t = ?index:int -> ?term:int -> ?command:string -> unit -> t
    val merge: t -> t -> t
    val to_proto': Runtime'.Writer.t -> t -> unit
    val from_proto_exn: Runtime'.Reader.t -> t
    val from_json_exn: Runtime'.Json.t -> t
    (**/**)
  end
  and AppendEntriesRequest : sig
    type t = {
    term: int;
    leader_id: int;
    prev_log_index: int;
    prev_log_term: int;
    entries: LogEntry.t list;(** The log entries to append *)
    leader_commit: int;
    }[@@deriving show { with_path = false }]
    val make: ?term:int -> ?leader_id:int -> ?prev_log_index:int -> ?prev_log_term:int -> ?entries:LogEntry.t list -> ?leader_commit:int -> unit -> t
    (** Helper function to generate a message using default values *)

    val to_proto: t -> Runtime'.Writer.t
    (** Serialize the message to binary format *)

    val from_proto: Runtime'.Reader.t -> (t, [> Runtime'.Result.error]) result
    (** Deserialize from binary format *)

    val to_json: Runtime'.Json_options.t -> t -> Runtime'.Json.t
    (** Serialize to Json (compatible with Yojson.Basic.t) *)

    val from_json: Runtime'.Json.t -> (t, [> Runtime'.Result.error]) result
    (** Deserialize from Json (compatible with Yojson.Basic.t) *)

    val name: unit -> string
    (** Fully qualified protobuf name of this message *)

    (**/**)
    type make_t = ?term:int -> ?leader_id:int -> ?prev_log_index:int -> ?prev_log_term:int -> ?entries:LogEntry.t list -> ?leader_commit:int -> unit -> t
    val merge: t -> t -> t
    val to_proto': Runtime'.Writer.t -> t -> unit
    val from_proto_exn: Runtime'.Reader.t -> t
    val from_json_exn: Runtime'.Json.t -> t
    (**/**)
  end
  and AppendEntriesResponse : sig
    type t = {
    term: int;
    success: bool;
    }[@@deriving show { with_path = false }]
    val make: ?term:int -> ?success:bool -> unit -> t
    (** Helper function to generate a message using default values *)

    val to_proto: t -> Runtime'.Writer.t
    (** Serialize the message to binary format *)

    val from_proto: Runtime'.Reader.t -> (t, [> Runtime'.Result.error]) result
    (** Deserialize from binary format *)

    val to_json: Runtime'.Json_options.t -> t -> Runtime'.Json.t
    (** Serialize to Json (compatible with Yojson.Basic.t) *)

    val from_json: Runtime'.Json.t -> (t, [> Runtime'.Result.error]) result
    (** Deserialize from Json (compatible with Yojson.Basic.t) *)

    val name: unit -> string
    (** Fully qualified protobuf name of this message *)

    (**/**)
    type make_t = ?term:int -> ?success:bool -> unit -> t
    val merge: t -> t -> t
    val to_proto': Runtime'.Writer.t -> t -> unit
    val from_proto_exn: Runtime'.Reader.t -> t
    val from_json_exn: Runtime'.Json.t -> t
    (**/**)
  end
  module KeyValueStore : sig
    module GetState : sig
      include Runtime'.Service.Rpc with type Request.t = Empty.t and type Response.t = State.t
      module Request : Runtime'.Spec.Message with type t = Empty.t and type make_t = Empty.make_t
      (** Module alias for the request message for this method call *)

      module Response : Runtime'.Spec.Message with type t = State.t and type make_t = State.make_t
      (** Module alias for the response message for this method call *)

    end
    val getState : (module Runtime'.Spec.Message with type t = Empty.t) * (module Runtime'.Spec.Message with type t = State.t)
    module Get : sig
      include Runtime'.Service.Rpc with type Request.t = GetKey.t and type Response.t = Reply.t
      module Request : Runtime'.Spec.Message with type t = GetKey.t and type make_t = GetKey.make_t
      (** Module alias for the request message for this method call *)

      module Response : Runtime'.Spec.Message with type t = Reply.t and type make_t = Reply.make_t
      (** Module alias for the response message for this method call *)

    end
    val get : (module Runtime'.Spec.Message with type t = GetKey.t) * (module Runtime'.Spec.Message with type t = Reply.t)
    module Put : sig
      include Runtime'.Service.Rpc with type Request.t = KeyValue.t and type Response.t = Reply.t
      module Request : Runtime'.Spec.Message with type t = KeyValue.t and type make_t = KeyValue.make_t
      (** Module alias for the request message for this method call *)

      module Response : Runtime'.Spec.Message with type t = Reply.t and type make_t = Reply.make_t
      (** Module alias for the response message for this method call *)

    end
    val put : (module Runtime'.Spec.Message with type t = KeyValue.t) * (module Runtime'.Spec.Message with type t = Reply.t)
    module Replace : sig
      include Runtime'.Service.Rpc with type Request.t = KeyValue.t and type Response.t = Reply.t
      module Request : Runtime'.Spec.Message with type t = KeyValue.t and type make_t = KeyValue.make_t
      (** Module alias for the request message for this method call *)

      module Response : Runtime'.Spec.Message with type t = Reply.t and type make_t = Reply.make_t
      (** Module alias for the response message for this method call *)

    end
    val replace : (module Runtime'.Spec.Message with type t = KeyValue.t) * (module Runtime'.Spec.Message with type t = Reply.t)
    module RequestVote : sig
      include Runtime'.Service.Rpc with type Request.t = RequestVoteRequest.t and type Response.t = RequestVoteResponse.t
      module Request : Runtime'.Spec.Message with type t = RequestVoteRequest.t and type make_t = RequestVoteRequest.make_t
      (** Module alias for the request message for this method call *)

      module Response : Runtime'.Spec.Message with type t = RequestVoteResponse.t and type make_t = RequestVoteResponse.make_t
      (** Module alias for the response message for this method call *)

    end
    val requestVote : (module Runtime'.Spec.Message with type t = RequestVoteRequest.t) * (module Runtime'.Spec.Message with type t = RequestVoteResponse.t)
    module AppendEntries : sig
      include Runtime'.Service.Rpc with type Request.t = AppendEntriesRequest.t and type Response.t = AppendEntriesResponse.t
      module Request : Runtime'.Spec.Message with type t = AppendEntriesRequest.t and type make_t = AppendEntriesRequest.make_t
      (** Module alias for the request message for this method call *)

      module Response : Runtime'.Spec.Message with type t = AppendEntriesResponse.t and type make_t = AppendEntriesResponse.make_t
      (** Module alias for the response message for this method call *)

    end
    val appendEntries : (module Runtime'.Spec.Message with type t = AppendEntriesRequest.t) * (module Runtime'.Spec.Message with type t = AppendEntriesResponse.t)
  end
  module FrontEnd : sig
    module Get : sig
      include Runtime'.Service.Rpc with type Request.t = GetKey.t and type Response.t = Reply.t
      module Request : Runtime'.Spec.Message with type t = GetKey.t and type make_t = GetKey.make_t
      (** Module alias for the request message for this method call *)

      module Response : Runtime'.Spec.Message with type t = Reply.t and type make_t = Reply.make_t
      (** Module alias for the response message for this method call *)

    end
    val get : (module Runtime'.Spec.Message with type t = GetKey.t) * (module Runtime'.Spec.Message with type t = Reply.t)
    module Put : sig
      include Runtime'.Service.Rpc with type Request.t = KeyValue.t and type Response.t = Reply.t
      module Request : Runtime'.Spec.Message with type t = KeyValue.t and type make_t = KeyValue.make_t
      (** Module alias for the request message for this method call *)

      module Response : Runtime'.Spec.Message with type t = Reply.t and type make_t = Reply.make_t
      (** Module alias for the response message for this method call *)

    end
    val put : (module Runtime'.Spec.Message with type t = KeyValue.t) * (module Runtime'.Spec.Message with type t = Reply.t)
    module Replace : sig
      include Runtime'.Service.Rpc with type Request.t = KeyValue.t and type Response.t = Reply.t
      module Request : Runtime'.Spec.Message with type t = KeyValue.t and type make_t = KeyValue.make_t
      (** Module alias for the request message for this method call *)

      module Response : Runtime'.Spec.Message with type t = Reply.t and type make_t = Reply.make_t
      (** Module alias for the response message for this method call *)

    end
    val replace : (module Runtime'.Spec.Message with type t = KeyValue.t) * (module Runtime'.Spec.Message with type t = Reply.t)
    module StartRaft : sig
      include Runtime'.Service.Rpc with type Request.t = IntegerArg.t and type Response.t = Reply.t
      module Request : Runtime'.Spec.Message with type t = IntegerArg.t and type make_t = IntegerArg.make_t
      (** Module alias for the request message for this method call *)

      module Response : Runtime'.Spec.Message with type t = Reply.t and type make_t = Reply.make_t
      (** Module alias for the response message for this method call *)

    end
    val startRaft : (module Runtime'.Spec.Message with type t = IntegerArg.t) * (module Runtime'.Spec.Message with type t = Reply.t)
    module NewLeader : sig
      include Runtime'.Service.Rpc with type Request.t = IntegerArg.t and type Response.t = Empty.t
      module Request : Runtime'.Spec.Message with type t = IntegerArg.t and type make_t = IntegerArg.make_t
      (** Module alias for the request message for this method call *)

      module Response : Runtime'.Spec.Message with type t = Empty.t and type make_t = Empty.make_t
      (** Module alias for the response message for this method call *)

    end
    val newLeader : (module Runtime'.Spec.Message with type t = IntegerArg.t) * (module Runtime'.Spec.Message with type t = Empty.t)
  end
end = struct
  module rec State : sig
    type t = {
    term: int;
    isLeader: bool;
    }[@@deriving show { with_path = false }]
    val make: ?term:int -> ?isLeader:bool -> unit -> t
    (** Helper function to generate a message using default values *)

    val to_proto: t -> Runtime'.Writer.t
    (** Serialize the message to binary format *)

    val from_proto: Runtime'.Reader.t -> (t, [> Runtime'.Result.error]) result
    (** Deserialize from binary format *)

    val to_json: Runtime'.Json_options.t -> t -> Runtime'.Json.t
    (** Serialize to Json (compatible with Yojson.Basic.t) *)

    val from_json: Runtime'.Json.t -> (t, [> Runtime'.Result.error]) result
    (** Deserialize from Json (compatible with Yojson.Basic.t) *)

    val name: unit -> string
    (** Fully qualified protobuf name of this message *)

    (**/**)
    type make_t = ?term:int -> ?isLeader:bool -> unit -> t
    val merge: t -> t -> t
    val to_proto': Runtime'.Writer.t -> t -> unit
    val from_proto_exn: Runtime'.Reader.t -> t
    val from_json_exn: Runtime'.Json.t -> t
    (**/**)
  end = struct
    module This'_ = State
    let name () = ".raftkv.State"
    type t = {
    term: int;
    isLeader: bool;
    }[@@deriving show { with_path = false }]
    type make_t = ?term:int -> ?isLeader:bool -> unit -> t
    let make ?(term = 0) ?(isLeader = false) () = { term; isLeader }
    let merge =
    let merge_term = Runtime'.Merge.merge Runtime'.Spec.( basic ((1, "term", "term"), int32_int, (0)) ) in
    let merge_isLeader = Runtime'.Merge.merge Runtime'.Spec.( basic ((2, "isLeader", "isLeader"), bool, (false)) ) in
    fun t1 t2 -> {
    term = (merge_term t1.term t2.term);
    isLeader = (merge_isLeader t1.isLeader t2.isLeader);
     }
    let spec () = Runtime'.Spec.( basic ((1, "term", "term"), int32_int, (0)) ^:: basic ((2, "isLeader", "isLeader"), bool, (false)) ^:: nil )
    let to_proto' =
      let serialize = Runtime'.apply_lazy (fun () -> Runtime'.Serialize.serialize (spec ())) in
      fun writer { term; isLeader } -> serialize writer term isLeader

    let to_proto t = let writer = Runtime'.Writer.init () in to_proto' writer t; writer
    let from_proto_exn =
      let constructor term isLeader = { term; isLeader } in
      Runtime'.apply_lazy (fun () -> Runtime'.Deserialize.deserialize (spec ()) constructor)
    let from_proto writer = Runtime'.Result.catch (fun () -> from_proto_exn writer)
    let to_json options =
      let serialize = Runtime'.Serialize_json.serialize ~message_name:(name ()) (spec ()) options in
      fun { term; isLeader } -> serialize term isLeader
    let from_json_exn =
      let constructor term isLeader = { term; isLeader } in
      Runtime'.apply_lazy (fun () -> Runtime'.Deserialize_json.deserialize ~message_name:(name ()) (spec ()) constructor)
    let from_json json = Runtime'.Result.catch (fun () -> from_json_exn json)
  end
  and KeyValue : sig
    type t = {
    key: string;
    value: string;
    clientId: int;
    requestId: int;
    }[@@deriving show { with_path = false }]
    val make: ?key:string -> ?value:string -> ?clientId:int -> ?requestId:int -> unit -> t
    (** Helper function to generate a message using default values *)

    val to_proto: t -> Runtime'.Writer.t
    (** Serialize the message to binary format *)

    val from_proto: Runtime'.Reader.t -> (t, [> Runtime'.Result.error]) result
    (** Deserialize from binary format *)

    val to_json: Runtime'.Json_options.t -> t -> Runtime'.Json.t
    (** Serialize to Json (compatible with Yojson.Basic.t) *)

    val from_json: Runtime'.Json.t -> (t, [> Runtime'.Result.error]) result
    (** Deserialize from Json (compatible with Yojson.Basic.t) *)

    val name: unit -> string
    (** Fully qualified protobuf name of this message *)

    (**/**)
    type make_t = ?key:string -> ?value:string -> ?clientId:int -> ?requestId:int -> unit -> t
    val merge: t -> t -> t
    val to_proto': Runtime'.Writer.t -> t -> unit
    val from_proto_exn: Runtime'.Reader.t -> t
    val from_json_exn: Runtime'.Json.t -> t
    (**/**)
  end = struct
    module This'_ = KeyValue
    let name () = ".raftkv.KeyValue"
    type t = {
    key: string;
    value: string;
    clientId: int;
    requestId: int;
    }[@@deriving show { with_path = false }]
    type make_t = ?key:string -> ?value:string -> ?clientId:int -> ?requestId:int -> unit -> t
    let make ?(key = {||}) ?(value = {||}) ?(clientId = 0) ?(requestId = 0) () = { key; value; clientId; requestId }
    let merge =
    let merge_key = Runtime'.Merge.merge Runtime'.Spec.( basic ((1, "key", "key"), string, ({||})) ) in
    let merge_value = Runtime'.Merge.merge Runtime'.Spec.( basic ((2, "value", "value"), string, ({||})) ) in
    let merge_clientId = Runtime'.Merge.merge Runtime'.Spec.( basic ((3, "ClientId", "ClientId"), int64_int, (0)) ) in
    let merge_requestId = Runtime'.Merge.merge Runtime'.Spec.( basic ((4, "RequestId", "RequestId"), int64_int, (0)) ) in
    fun t1 t2 -> {
    key = (merge_key t1.key t2.key);
    value = (merge_value t1.value t2.value);
    clientId = (merge_clientId t1.clientId t2.clientId);
    requestId = (merge_requestId t1.requestId t2.requestId);
     }
    let spec () = Runtime'.Spec.( basic ((1, "key", "key"), string, ({||})) ^:: basic ((2, "value", "value"), string, ({||})) ^:: basic ((3, "ClientId", "ClientId"), int64_int, (0)) ^:: basic ((4, "RequestId", "RequestId"), int64_int, (0)) ^:: nil )
    let to_proto' =
      let serialize = Runtime'.apply_lazy (fun () -> Runtime'.Serialize.serialize (spec ())) in
      fun writer { key; value; clientId; requestId } -> serialize writer key value clientId requestId

    let to_proto t = let writer = Runtime'.Writer.init () in to_proto' writer t; writer
    let from_proto_exn =
      let constructor key value clientId requestId = { key; value; clientId; requestId } in
      Runtime'.apply_lazy (fun () -> Runtime'.Deserialize.deserialize (spec ()) constructor)
    let from_proto writer = Runtime'.Result.catch (fun () -> from_proto_exn writer)
    let to_json options =
      let serialize = Runtime'.Serialize_json.serialize ~message_name:(name ()) (spec ()) options in
      fun { key; value; clientId; requestId } -> serialize key value clientId requestId
    let from_json_exn =
      let constructor key value clientId requestId = { key; value; clientId; requestId } in
      Runtime'.apply_lazy (fun () -> Runtime'.Deserialize_json.deserialize ~message_name:(name ()) (spec ()) constructor)
    let from_json json = Runtime'.Result.catch (fun () -> from_json_exn json)
  end
  and GetKey : sig
    type t = {
    key: string;
    clientId: int;
    requestId: int;
    }[@@deriving show { with_path = false }]
    val make: ?key:string -> ?clientId:int -> ?requestId:int -> unit -> t
    (** Helper function to generate a message using default values *)

    val to_proto: t -> Runtime'.Writer.t
    (** Serialize the message to binary format *)

    val from_proto: Runtime'.Reader.t -> (t, [> Runtime'.Result.error]) result
    (** Deserialize from binary format *)

    val to_json: Runtime'.Json_options.t -> t -> Runtime'.Json.t
    (** Serialize to Json (compatible with Yojson.Basic.t) *)

    val from_json: Runtime'.Json.t -> (t, [> Runtime'.Result.error]) result
    (** Deserialize from Json (compatible with Yojson.Basic.t) *)

    val name: unit -> string
    (** Fully qualified protobuf name of this message *)

    (**/**)
    type make_t = ?key:string -> ?clientId:int -> ?requestId:int -> unit -> t
    val merge: t -> t -> t
    val to_proto': Runtime'.Writer.t -> t -> unit
    val from_proto_exn: Runtime'.Reader.t -> t
    val from_json_exn: Runtime'.Json.t -> t
    (**/**)
  end = struct
    module This'_ = GetKey
    let name () = ".raftkv.GetKey"
    type t = {
    key: string;
    clientId: int;
    requestId: int;
    }[@@deriving show { with_path = false }]
    type make_t = ?key:string -> ?clientId:int -> ?requestId:int -> unit -> t
    let make ?(key = {||}) ?(clientId = 0) ?(requestId = 0) () = { key; clientId; requestId }
    let merge =
    let merge_key = Runtime'.Merge.merge Runtime'.Spec.( basic ((1, "key", "key"), string, ({||})) ) in
    let merge_clientId = Runtime'.Merge.merge Runtime'.Spec.( basic ((2, "ClientId", "ClientId"), int64_int, (0)) ) in
    let merge_requestId = Runtime'.Merge.merge Runtime'.Spec.( basic ((3, "RequestId", "RequestId"), int64_int, (0)) ) in
    fun t1 t2 -> {
    key = (merge_key t1.key t2.key);
    clientId = (merge_clientId t1.clientId t2.clientId);
    requestId = (merge_requestId t1.requestId t2.requestId);
     }
    let spec () = Runtime'.Spec.( basic ((1, "key", "key"), string, ({||})) ^:: basic ((2, "ClientId", "ClientId"), int64_int, (0)) ^:: basic ((3, "RequestId", "RequestId"), int64_int, (0)) ^:: nil )
    let to_proto' =
      let serialize = Runtime'.apply_lazy (fun () -> Runtime'.Serialize.serialize (spec ())) in
      fun writer { key; clientId; requestId } -> serialize writer key clientId requestId

    let to_proto t = let writer = Runtime'.Writer.init () in to_proto' writer t; writer
    let from_proto_exn =
      let constructor key clientId requestId = { key; clientId; requestId } in
      Runtime'.apply_lazy (fun () -> Runtime'.Deserialize.deserialize (spec ()) constructor)
    let from_proto writer = Runtime'.Result.catch (fun () -> from_proto_exn writer)
    let to_json options =
      let serialize = Runtime'.Serialize_json.serialize ~message_name:(name ()) (spec ()) options in
      fun { key; clientId; requestId } -> serialize key clientId requestId
    let from_json_exn =
      let constructor key clientId requestId = { key; clientId; requestId } in
      Runtime'.apply_lazy (fun () -> Runtime'.Deserialize_json.deserialize ~message_name:(name ()) (spec ()) constructor)
    let from_json json = Runtime'.Result.catch (fun () -> from_json_exn json)
  end
  and Reply : sig
    type t = {
    wrongLeader: bool;
    error: string;
    value: string;
    }[@@deriving show { with_path = false }]
    val make: ?wrongLeader:bool -> ?error:string -> ?value:string -> unit -> t
    (** Helper function to generate a message using default values *)

    val to_proto: t -> Runtime'.Writer.t
    (** Serialize the message to binary format *)

    val from_proto: Runtime'.Reader.t -> (t, [> Runtime'.Result.error]) result
    (** Deserialize from binary format *)

    val to_json: Runtime'.Json_options.t -> t -> Runtime'.Json.t
    (** Serialize to Json (compatible with Yojson.Basic.t) *)

    val from_json: Runtime'.Json.t -> (t, [> Runtime'.Result.error]) result
    (** Deserialize from Json (compatible with Yojson.Basic.t) *)

    val name: unit -> string
    (** Fully qualified protobuf name of this message *)

    (**/**)
    type make_t = ?wrongLeader:bool -> ?error:string -> ?value:string -> unit -> t
    val merge: t -> t -> t
    val to_proto': Runtime'.Writer.t -> t -> unit
    val from_proto_exn: Runtime'.Reader.t -> t
    val from_json_exn: Runtime'.Json.t -> t
    (**/**)
  end = struct
    module This'_ = Reply
    let name () = ".raftkv.Reply"
    type t = {
    wrongLeader: bool;
    error: string;
    value: string;
    }[@@deriving show { with_path = false }]
    type make_t = ?wrongLeader:bool -> ?error:string -> ?value:string -> unit -> t
    let make ?(wrongLeader = false) ?(error = {||}) ?(value = {||}) () = { wrongLeader; error; value }
    let merge =
    let merge_wrongLeader = Runtime'.Merge.merge Runtime'.Spec.( basic ((1, "wrongLeader", "wrongLeader"), bool, (false)) ) in
    let merge_error = Runtime'.Merge.merge Runtime'.Spec.( basic ((2, "error", "error"), string, ({||})) ) in
    let merge_value = Runtime'.Merge.merge Runtime'.Spec.( basic ((3, "value", "value"), string, ({||})) ) in
    fun t1 t2 -> {
    wrongLeader = (merge_wrongLeader t1.wrongLeader t2.wrongLeader);
    error = (merge_error t1.error t2.error);
    value = (merge_value t1.value t2.value);
     }
    let spec () = Runtime'.Spec.( basic ((1, "wrongLeader", "wrongLeader"), bool, (false)) ^:: basic ((2, "error", "error"), string, ({||})) ^:: basic ((3, "value", "value"), string, ({||})) ^:: nil )
    let to_proto' =
      let serialize = Runtime'.apply_lazy (fun () -> Runtime'.Serialize.serialize (spec ())) in
      fun writer { wrongLeader; error; value } -> serialize writer wrongLeader error value

    let to_proto t = let writer = Runtime'.Writer.init () in to_proto' writer t; writer
    let from_proto_exn =
      let constructor wrongLeader error value = { wrongLeader; error; value } in
      Runtime'.apply_lazy (fun () -> Runtime'.Deserialize.deserialize (spec ()) constructor)
    let from_proto writer = Runtime'.Result.catch (fun () -> from_proto_exn writer)
    let to_json options =
      let serialize = Runtime'.Serialize_json.serialize ~message_name:(name ()) (spec ()) options in
      fun { wrongLeader; error; value } -> serialize wrongLeader error value
    let from_json_exn =
      let constructor wrongLeader error value = { wrongLeader; error; value } in
      Runtime'.apply_lazy (fun () -> Runtime'.Deserialize_json.deserialize ~message_name:(name ()) (spec ()) constructor)
    let from_json json = Runtime'.Result.catch (fun () -> from_json_exn json)
  end
  and Empty : sig
    type t = unit[@@deriving show { with_path = false }]
    val make: unit -> t
    (** Helper function to generate a message using default values *)

    val to_proto: t -> Runtime'.Writer.t
    (** Serialize the message to binary format *)

    val from_proto: Runtime'.Reader.t -> (t, [> Runtime'.Result.error]) result
    (** Deserialize from binary format *)

    val to_json: Runtime'.Json_options.t -> t -> Runtime'.Json.t
    (** Serialize to Json (compatible with Yojson.Basic.t) *)

    val from_json: Runtime'.Json.t -> (t, [> Runtime'.Result.error]) result
    (** Deserialize from Json (compatible with Yojson.Basic.t) *)

    val name: unit -> string
    (** Fully qualified protobuf name of this message *)

    (**/**)
    type make_t = unit -> t
    val merge: t -> t -> t
    val to_proto': Runtime'.Writer.t -> t -> unit
    val from_proto_exn: Runtime'.Reader.t -> t
    val from_json_exn: Runtime'.Json.t -> t
    (**/**)
  end = struct
    module This'_ = Empty
    let name () = ".raftkv.Empty"
    type t = unit[@@deriving show { with_path = false }]
    type make_t = unit -> t
    let make () = ()
    let merge =

    fun () () -> ()
    let spec () = Runtime'.Spec.( nil )
    let to_proto' =
      let serialize = Runtime'.apply_lazy (fun () -> Runtime'.Serialize.serialize (spec ())) in
      fun writer () -> serialize writer

    let to_proto t = let writer = Runtime'.Writer.init () in to_proto' writer t; writer
    let from_proto_exn =
      let constructor  = () in
      Runtime'.apply_lazy (fun () -> Runtime'.Deserialize.deserialize (spec ()) constructor)
    let from_proto writer = Runtime'.Result.catch (fun () -> from_proto_exn writer)
    let to_json options =
      let serialize = Runtime'.Serialize_json.serialize ~message_name:(name ()) (spec ()) options in
      fun () -> serialize
    let from_json_exn =
      let constructor  = () in
      Runtime'.apply_lazy (fun () -> Runtime'.Deserialize_json.deserialize ~message_name:(name ()) (spec ()) constructor)
    let from_json json = Runtime'.Result.catch (fun () -> from_json_exn json)
  end
  and IntegerArg : sig
    type t = (int)[@@deriving show { with_path = false }]
    val make: ?arg:int -> unit -> t
    (** Helper function to generate a message using default values *)

    val to_proto: t -> Runtime'.Writer.t
    (** Serialize the message to binary format *)

    val from_proto: Runtime'.Reader.t -> (t, [> Runtime'.Result.error]) result
    (** Deserialize from binary format *)

    val to_json: Runtime'.Json_options.t -> t -> Runtime'.Json.t
    (** Serialize to Json (compatible with Yojson.Basic.t) *)

    val from_json: Runtime'.Json.t -> (t, [> Runtime'.Result.error]) result
    (** Deserialize from Json (compatible with Yojson.Basic.t) *)

    val name: unit -> string
    (** Fully qualified protobuf name of this message *)

    (**/**)
    type make_t = ?arg:int -> unit -> t
    val merge: t -> t -> t
    val to_proto': Runtime'.Writer.t -> t -> unit
    val from_proto_exn: Runtime'.Reader.t -> t
    val from_json_exn: Runtime'.Json.t -> t
    (**/**)
  end = struct
    module This'_ = IntegerArg
    let name () = ".raftkv.IntegerArg"
    type t = (int)[@@deriving show { with_path = false }]
    type make_t = ?arg:int -> unit -> t
    let make ?(arg = 0) () = (arg)
    let merge =
    let merge_arg = Runtime'.Merge.merge Runtime'.Spec.( basic ((1, "arg", "arg"), int32_int, (0)) ) in
    fun (t1_arg) (t2_arg) -> merge_arg t1_arg t2_arg
    let spec () = Runtime'.Spec.( basic ((1, "arg", "arg"), int32_int, (0)) ^:: nil )
    let to_proto' =
      let serialize = Runtime'.apply_lazy (fun () -> Runtime'.Serialize.serialize (spec ())) in
      fun writer (arg) -> serialize writer arg

    let to_proto t = let writer = Runtime'.Writer.init () in to_proto' writer t; writer
    let from_proto_exn =
      let constructor arg = (arg) in
      Runtime'.apply_lazy (fun () -> Runtime'.Deserialize.deserialize (spec ()) constructor)
    let from_proto writer = Runtime'.Result.catch (fun () -> from_proto_exn writer)
    let to_json options =
      let serialize = Runtime'.Serialize_json.serialize ~message_name:(name ()) (spec ()) options in
      fun (arg) -> serialize arg
    let from_json_exn =
      let constructor arg = (arg) in
      Runtime'.apply_lazy (fun () -> Runtime'.Deserialize_json.deserialize ~message_name:(name ()) (spec ()) constructor)
    let from_json json = Runtime'.Result.catch (fun () -> from_json_exn json)
  end
  and RequestVoteRequest : sig
    type t = {
    candidate_id: int;(** ID of the candidate requesting the vote *)
    term: int;(** Term number of the candidate *)
    last_log_index: int;(** Index of the last log entry of the candidate *)
    last_log_term: int;(** Term of the last log entry of the candidate *)
    }[@@deriving show { with_path = false }]
    val make: ?candidate_id:int -> ?term:int -> ?last_log_index:int -> ?last_log_term:int -> unit -> t
    (** Helper function to generate a message using default values *)

    val to_proto: t -> Runtime'.Writer.t
    (** Serialize the message to binary format *)

    val from_proto: Runtime'.Reader.t -> (t, [> Runtime'.Result.error]) result
    (** Deserialize from binary format *)

    val to_json: Runtime'.Json_options.t -> t -> Runtime'.Json.t
    (** Serialize to Json (compatible with Yojson.Basic.t) *)

    val from_json: Runtime'.Json.t -> (t, [> Runtime'.Result.error]) result
    (** Deserialize from Json (compatible with Yojson.Basic.t) *)

    val name: unit -> string
    (** Fully qualified protobuf name of this message *)

    (**/**)
    type make_t = ?candidate_id:int -> ?term:int -> ?last_log_index:int -> ?last_log_term:int -> unit -> t
    val merge: t -> t -> t
    val to_proto': Runtime'.Writer.t -> t -> unit
    val from_proto_exn: Runtime'.Reader.t -> t
    val from_json_exn: Runtime'.Json.t -> t
    (**/**)
  end = struct
    module This'_ = RequestVoteRequest
    let name () = ".raftkv.RequestVoteRequest"
    type t = {
    candidate_id: int;(** ID of the candidate requesting the vote *)
    term: int;(** Term number of the candidate *)
    last_log_index: int;(** Index of the last log entry of the candidate *)
    last_log_term: int;(** Term of the last log entry of the candidate *)
    }[@@deriving show { with_path = false }]
    type make_t = ?candidate_id:int -> ?term:int -> ?last_log_index:int -> ?last_log_term:int -> unit -> t
    let make ?(candidate_id = 0) ?(term = 0) ?(last_log_index = 0) ?(last_log_term = 0) () = { candidate_id; term; last_log_index; last_log_term }
    let merge =
    let merge_candidate_id = Runtime'.Merge.merge Runtime'.Spec.( basic ((1, "candidate_id", "candidateId"), int32_int, (0)) ) in
    let merge_term = Runtime'.Merge.merge Runtime'.Spec.( basic ((2, "term", "term"), int32_int, (0)) ) in
    let merge_last_log_index = Runtime'.Merge.merge Runtime'.Spec.( basic ((3, "last_log_index", "lastLogIndex"), int32_int, (0)) ) in
    let merge_last_log_term = Runtime'.Merge.merge Runtime'.Spec.( basic ((4, "last_log_term", "lastLogTerm"), int32_int, (0)) ) in
    fun t1 t2 -> {
    candidate_id = (merge_candidate_id t1.candidate_id t2.candidate_id);
    term = (merge_term t1.term t2.term);
    last_log_index = (merge_last_log_index t1.last_log_index t2.last_log_index);
    last_log_term = (merge_last_log_term t1.last_log_term t2.last_log_term);
     }
    let spec () = Runtime'.Spec.( basic ((1, "candidate_id", "candidateId"), int32_int, (0)) ^:: basic ((2, "term", "term"), int32_int, (0)) ^:: basic ((3, "last_log_index", "lastLogIndex"), int32_int, (0)) ^:: basic ((4, "last_log_term", "lastLogTerm"), int32_int, (0)) ^:: nil )
    let to_proto' =
      let serialize = Runtime'.apply_lazy (fun () -> Runtime'.Serialize.serialize (spec ())) in
      fun writer { candidate_id; term; last_log_index; last_log_term } -> serialize writer candidate_id term last_log_index last_log_term

    let to_proto t = let writer = Runtime'.Writer.init () in to_proto' writer t; writer
    let from_proto_exn =
      let constructor candidate_id term last_log_index last_log_term = { candidate_id; term; last_log_index; last_log_term } in
      Runtime'.apply_lazy (fun () -> Runtime'.Deserialize.deserialize (spec ()) constructor)
    let from_proto writer = Runtime'.Result.catch (fun () -> from_proto_exn writer)
    let to_json options =
      let serialize = Runtime'.Serialize_json.serialize ~message_name:(name ()) (spec ()) options in
      fun { candidate_id; term; last_log_index; last_log_term } -> serialize candidate_id term last_log_index last_log_term
    let from_json_exn =
      let constructor candidate_id term last_log_index last_log_term = { candidate_id; term; last_log_index; last_log_term } in
      Runtime'.apply_lazy (fun () -> Runtime'.Deserialize_json.deserialize ~message_name:(name ()) (spec ()) constructor)
    let from_json json = Runtime'.Result.catch (fun () -> from_json_exn json)
  end
  and RequestVoteResponse : sig
    type t = {
    vote_granted: bool;(** Whether the vote is granted or not *)
    term: int;(** Current term of the receiver *)
    }[@@deriving show { with_path = false }]
    val make: ?vote_granted:bool -> ?term:int -> unit -> t
    (** Helper function to generate a message using default values *)

    val to_proto: t -> Runtime'.Writer.t
    (** Serialize the message to binary format *)

    val from_proto: Runtime'.Reader.t -> (t, [> Runtime'.Result.error]) result
    (** Deserialize from binary format *)

    val to_json: Runtime'.Json_options.t -> t -> Runtime'.Json.t
    (** Serialize to Json (compatible with Yojson.Basic.t) *)

    val from_json: Runtime'.Json.t -> (t, [> Runtime'.Result.error]) result
    (** Deserialize from Json (compatible with Yojson.Basic.t) *)

    val name: unit -> string
    (** Fully qualified protobuf name of this message *)

    (**/**)
    type make_t = ?vote_granted:bool -> ?term:int -> unit -> t
    val merge: t -> t -> t
    val to_proto': Runtime'.Writer.t -> t -> unit
    val from_proto_exn: Runtime'.Reader.t -> t
    val from_json_exn: Runtime'.Json.t -> t
    (**/**)
  end = struct
    module This'_ = RequestVoteResponse
    let name () = ".raftkv.RequestVoteResponse"
    type t = {
    vote_granted: bool;(** Whether the vote is granted or not *)
    term: int;(** Current term of the receiver *)
    }[@@deriving show { with_path = false }]
    type make_t = ?vote_granted:bool -> ?term:int -> unit -> t
    let make ?(vote_granted = false) ?(term = 0) () = { vote_granted; term }
    let merge =
    let merge_vote_granted = Runtime'.Merge.merge Runtime'.Spec.( basic ((1, "vote_granted", "voteGranted"), bool, (false)) ) in
    let merge_term = Runtime'.Merge.merge Runtime'.Spec.( basic ((2, "term", "term"), int32_int, (0)) ) in
    fun t1 t2 -> {
    vote_granted = (merge_vote_granted t1.vote_granted t2.vote_granted);
    term = (merge_term t1.term t2.term);
     }
    let spec () = Runtime'.Spec.( basic ((1, "vote_granted", "voteGranted"), bool, (false)) ^:: basic ((2, "term", "term"), int32_int, (0)) ^:: nil )
    let to_proto' =
      let serialize = Runtime'.apply_lazy (fun () -> Runtime'.Serialize.serialize (spec ())) in
      fun writer { vote_granted; term } -> serialize writer vote_granted term

    let to_proto t = let writer = Runtime'.Writer.init () in to_proto' writer t; writer
    let from_proto_exn =
      let constructor vote_granted term = { vote_granted; term } in
      Runtime'.apply_lazy (fun () -> Runtime'.Deserialize.deserialize (spec ()) constructor)
    let from_proto writer = Runtime'.Result.catch (fun () -> from_proto_exn writer)
    let to_json options =
      let serialize = Runtime'.Serialize_json.serialize ~message_name:(name ()) (spec ()) options in
      fun { vote_granted; term } -> serialize vote_granted term
    let from_json_exn =
      let constructor vote_granted term = { vote_granted; term } in
      Runtime'.apply_lazy (fun () -> Runtime'.Deserialize_json.deserialize ~message_name:(name ()) (spec ()) constructor)
    let from_json json = Runtime'.Result.catch (fun () -> from_json_exn json)
  end
  and LogEntry : sig
    type t = {
    index: int;
    term: int;
    command: string;(** Represents a command or data in the entry *)
    }[@@deriving show { with_path = false }]
    val make: ?index:int -> ?term:int -> ?command:string -> unit -> t
    (** Helper function to generate a message using default values *)

    val to_proto: t -> Runtime'.Writer.t
    (** Serialize the message to binary format *)

    val from_proto: Runtime'.Reader.t -> (t, [> Runtime'.Result.error]) result
    (** Deserialize from binary format *)

    val to_json: Runtime'.Json_options.t -> t -> Runtime'.Json.t
    (** Serialize to Json (compatible with Yojson.Basic.t) *)

    val from_json: Runtime'.Json.t -> (t, [> Runtime'.Result.error]) result
    (** Deserialize from Json (compatible with Yojson.Basic.t) *)

    val name: unit -> string
    (** Fully qualified protobuf name of this message *)

    (**/**)
    type make_t = ?index:int -> ?term:int -> ?command:string -> unit -> t
    val merge: t -> t -> t
    val to_proto': Runtime'.Writer.t -> t -> unit
    val from_proto_exn: Runtime'.Reader.t -> t
    val from_json_exn: Runtime'.Json.t -> t
    (**/**)
  end = struct
    module This'_ = LogEntry
    let name () = ".raftkv.LogEntry"
    type t = {
    index: int;
    term: int;
    command: string;(** Represents a command or data in the entry *)
    }[@@deriving show { with_path = false }]
    type make_t = ?index:int -> ?term:int -> ?command:string -> unit -> t
    let make ?(index = 0) ?(term = 0) ?(command = {||}) () = { index; term; command }
    let merge =
    let merge_index = Runtime'.Merge.merge Runtime'.Spec.( basic ((1, "index", "index"), int32_int, (0)) ) in
    let merge_term = Runtime'.Merge.merge Runtime'.Spec.( basic ((2, "term", "term"), int32_int, (0)) ) in
    let merge_command = Runtime'.Merge.merge Runtime'.Spec.( basic ((3, "command", "command"), string, ({||})) ) in
    fun t1 t2 -> {
    index = (merge_index t1.index t2.index);
    term = (merge_term t1.term t2.term);
    command = (merge_command t1.command t2.command);
     }
    let spec () = Runtime'.Spec.( basic ((1, "index", "index"), int32_int, (0)) ^:: basic ((2, "term", "term"), int32_int, (0)) ^:: basic ((3, "command", "command"), string, ({||})) ^:: nil )
    let to_proto' =
      let serialize = Runtime'.apply_lazy (fun () -> Runtime'.Serialize.serialize (spec ())) in
      fun writer { index; term; command } -> serialize writer index term command

    let to_proto t = let writer = Runtime'.Writer.init () in to_proto' writer t; writer
    let from_proto_exn =
      let constructor index term command = { index; term; command } in
      Runtime'.apply_lazy (fun () -> Runtime'.Deserialize.deserialize (spec ()) constructor)
    let from_proto writer = Runtime'.Result.catch (fun () -> from_proto_exn writer)
    let to_json options =
      let serialize = Runtime'.Serialize_json.serialize ~message_name:(name ()) (spec ()) options in
      fun { index; term; command } -> serialize index term command
    let from_json_exn =
      let constructor index term command = { index; term; command } in
      Runtime'.apply_lazy (fun () -> Runtime'.Deserialize_json.deserialize ~message_name:(name ()) (spec ()) constructor)
    let from_json json = Runtime'.Result.catch (fun () -> from_json_exn json)
  end
  and AppendEntriesRequest : sig
    type t = {
    term: int;
    leader_id: int;
    prev_log_index: int;
    prev_log_term: int;
    entries: LogEntry.t list;(** The log entries to append *)
    leader_commit: int;
    }[@@deriving show { with_path = false }]
    val make: ?term:int -> ?leader_id:int -> ?prev_log_index:int -> ?prev_log_term:int -> ?entries:LogEntry.t list -> ?leader_commit:int -> unit -> t
    (** Helper function to generate a message using default values *)

    val to_proto: t -> Runtime'.Writer.t
    (** Serialize the message to binary format *)

    val from_proto: Runtime'.Reader.t -> (t, [> Runtime'.Result.error]) result
    (** Deserialize from binary format *)

    val to_json: Runtime'.Json_options.t -> t -> Runtime'.Json.t
    (** Serialize to Json (compatible with Yojson.Basic.t) *)

    val from_json: Runtime'.Json.t -> (t, [> Runtime'.Result.error]) result
    (** Deserialize from Json (compatible with Yojson.Basic.t) *)

    val name: unit -> string
    (** Fully qualified protobuf name of this message *)

    (**/**)
    type make_t = ?term:int -> ?leader_id:int -> ?prev_log_index:int -> ?prev_log_term:int -> ?entries:LogEntry.t list -> ?leader_commit:int -> unit -> t
    val merge: t -> t -> t
    val to_proto': Runtime'.Writer.t -> t -> unit
    val from_proto_exn: Runtime'.Reader.t -> t
    val from_json_exn: Runtime'.Json.t -> t
    (**/**)
  end = struct
    module This'_ = AppendEntriesRequest
    let name () = ".raftkv.AppendEntriesRequest"
    type t = {
    term: int;
    leader_id: int;
    prev_log_index: int;
    prev_log_term: int;
    entries: LogEntry.t list;(** The log entries to append *)
    leader_commit: int;
    }[@@deriving show { with_path = false }]
    type make_t = ?term:int -> ?leader_id:int -> ?prev_log_index:int -> ?prev_log_term:int -> ?entries:LogEntry.t list -> ?leader_commit:int -> unit -> t
    let make ?(term = 0) ?(leader_id = 0) ?(prev_log_index = 0) ?(prev_log_term = 0) ?(entries = []) ?(leader_commit = 0) () = { term; leader_id; prev_log_index; prev_log_term; entries; leader_commit }
    let merge =
    let merge_term = Runtime'.Merge.merge Runtime'.Spec.( basic ((1, "term", "term"), int32_int, (0)) ) in
    let merge_leader_id = Runtime'.Merge.merge Runtime'.Spec.( basic ((2, "leader_id", "leaderId"), int32_int, (0)) ) in
    let merge_prev_log_index = Runtime'.Merge.merge Runtime'.Spec.( basic ((3, "prev_log_index", "prevLogIndex"), int32_int, (0)) ) in
    let merge_prev_log_term = Runtime'.Merge.merge Runtime'.Spec.( basic ((4, "prev_log_term", "prevLogTerm"), int32_int, (0)) ) in
    let merge_entries = Runtime'.Merge.merge Runtime'.Spec.( repeated ((5, "entries", "entries"), (message (module LogEntry)), not_packed) ) in
    let merge_leader_commit = Runtime'.Merge.merge Runtime'.Spec.( basic ((6, "leader_commit", "leaderCommit"), int32_int, (0)) ) in
    fun t1 t2 -> {
    term = (merge_term t1.term t2.term);
    leader_id = (merge_leader_id t1.leader_id t2.leader_id);
    prev_log_index = (merge_prev_log_index t1.prev_log_index t2.prev_log_index);
    prev_log_term = (merge_prev_log_term t1.prev_log_term t2.prev_log_term);
    entries = (merge_entries t1.entries t2.entries);
    leader_commit = (merge_leader_commit t1.leader_commit t2.leader_commit);
     }
    let spec () = Runtime'.Spec.( basic ((1, "term", "term"), int32_int, (0)) ^:: basic ((2, "leader_id", "leaderId"), int32_int, (0)) ^:: basic ((3, "prev_log_index", "prevLogIndex"), int32_int, (0)) ^:: basic ((4, "prev_log_term", "prevLogTerm"), int32_int, (0)) ^:: repeated ((5, "entries", "entries"), (message (module LogEntry)), not_packed) ^:: basic ((6, "leader_commit", "leaderCommit"), int32_int, (0)) ^:: nil )
    let to_proto' =
      let serialize = Runtime'.apply_lazy (fun () -> Runtime'.Serialize.serialize (spec ())) in
      fun writer { term; leader_id; prev_log_index; prev_log_term; entries; leader_commit } -> serialize writer term leader_id prev_log_index prev_log_term entries leader_commit

    let to_proto t = let writer = Runtime'.Writer.init () in to_proto' writer t; writer
    let from_proto_exn =
      let constructor term leader_id prev_log_index prev_log_term entries leader_commit = { term; leader_id; prev_log_index; prev_log_term; entries; leader_commit } in
      Runtime'.apply_lazy (fun () -> Runtime'.Deserialize.deserialize (spec ()) constructor)
    let from_proto writer = Runtime'.Result.catch (fun () -> from_proto_exn writer)
    let to_json options =
      let serialize = Runtime'.Serialize_json.serialize ~message_name:(name ()) (spec ()) options in
      fun { term; leader_id; prev_log_index; prev_log_term; entries; leader_commit } -> serialize term leader_id prev_log_index prev_log_term entries leader_commit
    let from_json_exn =
      let constructor term leader_id prev_log_index prev_log_term entries leader_commit = { term; leader_id; prev_log_index; prev_log_term; entries; leader_commit } in
      Runtime'.apply_lazy (fun () -> Runtime'.Deserialize_json.deserialize ~message_name:(name ()) (spec ()) constructor)
    let from_json json = Runtime'.Result.catch (fun () -> from_json_exn json)
  end
  and AppendEntriesResponse : sig
    type t = {
    term: int;
    success: bool;
    }[@@deriving show { with_path = false }]
    val make: ?term:int -> ?success:bool -> unit -> t
    (** Helper function to generate a message using default values *)

    val to_proto: t -> Runtime'.Writer.t
    (** Serialize the message to binary format *)

    val from_proto: Runtime'.Reader.t -> (t, [> Runtime'.Result.error]) result
    (** Deserialize from binary format *)

    val to_json: Runtime'.Json_options.t -> t -> Runtime'.Json.t
    (** Serialize to Json (compatible with Yojson.Basic.t) *)

    val from_json: Runtime'.Json.t -> (t, [> Runtime'.Result.error]) result
    (** Deserialize from Json (compatible with Yojson.Basic.t) *)

    val name: unit -> string
    (** Fully qualified protobuf name of this message *)

    (**/**)
    type make_t = ?term:int -> ?success:bool -> unit -> t
    val merge: t -> t -> t
    val to_proto': Runtime'.Writer.t -> t -> unit
    val from_proto_exn: Runtime'.Reader.t -> t
    val from_json_exn: Runtime'.Json.t -> t
    (**/**)
  end = struct
    module This'_ = AppendEntriesResponse
    let name () = ".raftkv.AppendEntriesResponse"
    type t = {
    term: int;
    success: bool;
    }[@@deriving show { with_path = false }]
    type make_t = ?term:int -> ?success:bool -> unit -> t
    let make ?(term = 0) ?(success = false) () = { term; success }
    let merge =
    let merge_term = Runtime'.Merge.merge Runtime'.Spec.( basic ((1, "term", "term"), int32_int, (0)) ) in
    let merge_success = Runtime'.Merge.merge Runtime'.Spec.( basic ((2, "success", "success"), bool, (false)) ) in
    fun t1 t2 -> {
    term = (merge_term t1.term t2.term);
    success = (merge_success t1.success t2.success);
     }
    let spec () = Runtime'.Spec.( basic ((1, "term", "term"), int32_int, (0)) ^:: basic ((2, "success", "success"), bool, (false)) ^:: nil )
    let to_proto' =
      let serialize = Runtime'.apply_lazy (fun () -> Runtime'.Serialize.serialize (spec ())) in
      fun writer { term; success } -> serialize writer term success

    let to_proto t = let writer = Runtime'.Writer.init () in to_proto' writer t; writer
    let from_proto_exn =
      let constructor term success = { term; success } in
      Runtime'.apply_lazy (fun () -> Runtime'.Deserialize.deserialize (spec ()) constructor)
    let from_proto writer = Runtime'.Result.catch (fun () -> from_proto_exn writer)
    let to_json options =
      let serialize = Runtime'.Serialize_json.serialize ~message_name:(name ()) (spec ()) options in
      fun { term; success } -> serialize term success
    let from_json_exn =
      let constructor term success = { term; success } in
      Runtime'.apply_lazy (fun () -> Runtime'.Deserialize_json.deserialize ~message_name:(name ()) (spec ()) constructor)
    let from_json json = Runtime'.Result.catch (fun () -> from_json_exn json)
  end
  module KeyValueStore = struct
    module GetState = struct
      let package_name = Some "raftkv"
      let service_name = "KeyValueStore"
      let method_name = "GetState"
      let name = "/raftkv.KeyValueStore/GetState"
      module Request = Empty
      module Response = State
    end
    let getState : (module Runtime'.Spec.Message with type t = Empty.t) * (module Runtime'.Spec.Message with type t = State.t) =
      (module Empty : Runtime'.Spec.Message with type t = Empty.t ),
      (module State : Runtime'.Spec.Message with type t = State.t )

    module Get = struct
      let package_name = Some "raftkv"
      let service_name = "KeyValueStore"
      let method_name = "Get"
      let name = "/raftkv.KeyValueStore/Get"
      module Request = GetKey
      module Response = Reply
    end
    let get : (module Runtime'.Spec.Message with type t = GetKey.t) * (module Runtime'.Spec.Message with type t = Reply.t) =
      (module GetKey : Runtime'.Spec.Message with type t = GetKey.t ),
      (module Reply : Runtime'.Spec.Message with type t = Reply.t )

    module Put = struct
      let package_name = Some "raftkv"
      let service_name = "KeyValueStore"
      let method_name = "Put"
      let name = "/raftkv.KeyValueStore/Put"
      module Request = KeyValue
      module Response = Reply
    end
    let put : (module Runtime'.Spec.Message with type t = KeyValue.t) * (module Runtime'.Spec.Message with type t = Reply.t) =
      (module KeyValue : Runtime'.Spec.Message with type t = KeyValue.t ),
      (module Reply : Runtime'.Spec.Message with type t = Reply.t )

    module Replace = struct
      let package_name = Some "raftkv"
      let service_name = "KeyValueStore"
      let method_name = "Replace"
      let name = "/raftkv.KeyValueStore/Replace"
      module Request = KeyValue
      module Response = Reply
    end
    let replace : (module Runtime'.Spec.Message with type t = KeyValue.t) * (module Runtime'.Spec.Message with type t = Reply.t) =
      (module KeyValue : Runtime'.Spec.Message with type t = KeyValue.t ),
      (module Reply : Runtime'.Spec.Message with type t = Reply.t )

    module RequestVote = struct
      let package_name = Some "raftkv"
      let service_name = "KeyValueStore"
      let method_name = "RequestVote"
      let name = "/raftkv.KeyValueStore/RequestVote"
      module Request = RequestVoteRequest
      module Response = RequestVoteResponse
    end
    let requestVote : (module Runtime'.Spec.Message with type t = RequestVoteRequest.t) * (module Runtime'.Spec.Message with type t = RequestVoteResponse.t) =
      (module RequestVoteRequest : Runtime'.Spec.Message with type t = RequestVoteRequest.t ),
      (module RequestVoteResponse : Runtime'.Spec.Message with type t = RequestVoteResponse.t )

    module AppendEntries = struct
      let package_name = Some "raftkv"
      let service_name = "KeyValueStore"
      let method_name = "AppendEntries"
      let name = "/raftkv.KeyValueStore/AppendEntries"
      module Request = AppendEntriesRequest
      module Response = AppendEntriesResponse
    end
    let appendEntries : (module Runtime'.Spec.Message with type t = AppendEntriesRequest.t) * (module Runtime'.Spec.Message with type t = AppendEntriesResponse.t) =
      (module AppendEntriesRequest : Runtime'.Spec.Message with type t = AppendEntriesRequest.t ),
      (module AppendEntriesResponse : Runtime'.Spec.Message with type t = AppendEntriesResponse.t )

  end
  module FrontEnd = struct
    module Get = struct
      let package_name = Some "raftkv"
      let service_name = "FrontEnd"
      let method_name = "Get"
      let name = "/raftkv.FrontEnd/Get"
      module Request = GetKey
      module Response = Reply
    end
    let get : (module Runtime'.Spec.Message with type t = GetKey.t) * (module Runtime'.Spec.Message with type t = Reply.t) =
      (module GetKey : Runtime'.Spec.Message with type t = GetKey.t ),
      (module Reply : Runtime'.Spec.Message with type t = Reply.t )

    module Put = struct
      let package_name = Some "raftkv"
      let service_name = "FrontEnd"
      let method_name = "Put"
      let name = "/raftkv.FrontEnd/Put"
      module Request = KeyValue
      module Response = Reply
    end
    let put : (module Runtime'.Spec.Message with type t = KeyValue.t) * (module Runtime'.Spec.Message with type t = Reply.t) =
      (module KeyValue : Runtime'.Spec.Message with type t = KeyValue.t ),
      (module Reply : Runtime'.Spec.Message with type t = Reply.t )

    module Replace = struct
      let package_name = Some "raftkv"
      let service_name = "FrontEnd"
      let method_name = "Replace"
      let name = "/raftkv.FrontEnd/Replace"
      module Request = KeyValue
      module Response = Reply
    end
    let replace : (module Runtime'.Spec.Message with type t = KeyValue.t) * (module Runtime'.Spec.Message with type t = Reply.t) =
      (module KeyValue : Runtime'.Spec.Message with type t = KeyValue.t ),
      (module Reply : Runtime'.Spec.Message with type t = Reply.t )

    module StartRaft = struct
      let package_name = Some "raftkv"
      let service_name = "FrontEnd"
      let method_name = "StartRaft"
      let name = "/raftkv.FrontEnd/StartRaft"
      module Request = IntegerArg
      module Response = Reply
    end
    let startRaft : (module Runtime'.Spec.Message with type t = IntegerArg.t) * (module Runtime'.Spec.Message with type t = Reply.t) =
      (module IntegerArg : Runtime'.Spec.Message with type t = IntegerArg.t ),
      (module Reply : Runtime'.Spec.Message with type t = Reply.t )

    module NewLeader = struct
      let package_name = Some "raftkv"
      let service_name = "FrontEnd"
      let method_name = "NewLeader"
      let name = "/raftkv.FrontEnd/NewLeader"
      module Request = IntegerArg
      module Response = Empty
    end
    let newLeader : (module Runtime'.Spec.Message with type t = IntegerArg.t) * (module Runtime'.Spec.Message with type t = Empty.t) =
      (module IntegerArg : Runtime'.Spec.Message with type t = IntegerArg.t ),
      (module Empty : Runtime'.Spec.Message with type t = Empty.t )

  end
end
