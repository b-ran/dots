let
  user = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEStFBOvj712L4dnWGyJJGVurtP/9NyRVs0Yepp5rzFZ";
in
{
  "hello.age".publicKeys = [ user ];
}