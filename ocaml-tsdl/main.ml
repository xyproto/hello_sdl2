open Tsdl
open Tsdl_image
open Result

let (>>=) o f =
  match o with | Error (`Msg e) -> failwith (Printf.sprintf "Error %s" e)
               | Ok a -> f a

let () =
  ignore (Sdl.init Sdl.Init.everything);
  let flags = Image.Init.(png) in
  assert ((Image.init flags) = flags);
  let Some sface = Image.load "../img/boxes.png" in
  assert (Image.is_format Image.Png f);
  Sdl.rw_close f |> ignore;
  Image.quit ();
  Sdl.quit ();
