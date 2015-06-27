(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   Sprite.ml                                          :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: ngoguey <ngoguey@student.42.fr>            +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2015/06/27 15:46:20 by ngoguey           #+#    #+#             *)
(*   Updated: 2015/06/27 20:02:17 by ngoguey          ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

type dat = {sid : int;
			iid : int;
			x0 : int; y0 : int;
			w : int; h : int;
			n : int; ncol : int;
			def_dt : int}

type tmpdat = {tslu : int;
			   dt : int;
			   phase : int}


let update_tmp td elapsed =
  if elapsed > td.dt then
	{td with tslu = 0; phase = td.phase + 1}
  else
	td

let new_sprite sid iid (x0, y0) (w, h) (n, ncol) def_dt =
  {sid = sid; iid = iid; x0 = x0; y0 = y0; w = w; h = h; n = n; ncol = ncol;
   def_dt = def_dt}

let new_tmp () =
  {tslu = 0; dt = 1000; phase = 0}

let rect d td =
  let line = td.phase / d.ncol in
  let col = td.phase mod d.ncol in
  let x = d.x0 + d.w * col in
  let y = d.y0 + d.h * line in
  Sdlvideo.rect x y d.w d.h

let iid d = d.iid
