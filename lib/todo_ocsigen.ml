let myservice =
  Eliom_service.create
    ~path:(Eliom_service.Path ["foo"])
    ~meth:(Eliom_service.Get (Eliom_parameter.(string "myparam" ** int "i")))
    ()

let () =
  Eliom_registration.Html.register ~service:myservice
    (fun (myparam, _i) () ->
      Lwt.return
        Eliom_content.Html.F.(html
                                (head (title (txt "Hello")) [])
                                (body [h1 [txt myparam]])))
