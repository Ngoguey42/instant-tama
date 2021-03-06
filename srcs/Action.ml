(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   Action.ml                                          :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: ngoguey <ngoguey@student.42.fr>            +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2015/06/27 18:15:44 by ngoguey           #+#    #+#             *)
(*   Updated: 2015/06/28 20:37:57 by ngoguey          ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let details =
  [|
	(* HEALTH, ENERGY, HYGIENE, HAPPYNESS *)
	(0, "Eat",		[|~+.25.; ~-.10.; ~-.20.; ~+.05.|]);
	(1, "Thunder",	[|~-.20.; ~+.25.; ~+.00.; ~-.20.|]);
	(2, "Bath",		[|~-.20.; ~-.10.; ~+.25.; ~+.05.|]);
	(3, "Kill",		[|~-.20.; ~-.10.; ~+.00.; ~+.20.|]);
	(* (4, "Teleport", [|~-.00.; ~-.00.; ~+.00.; ~+.00.|]); *)
   |]

let n = Array.length details

(** aid: Action id
 ** sv: Stats values *)
let apply_action aid (sv: Stat.t) : Stat.t =
  let (_, _, modifs) = details.(aid) in
  Array.mapi (fun i v -> v +. modifs.(i)) sv
