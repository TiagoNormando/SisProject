unit model.RetornoInvestimento.interfaces;

interface

uses   Vcl.Graphics, Vcl.StdCtrls;

type
  IRetornoInvestimento = Interface
    ['{E85FE0DA-07C4-4718-B674-D6DB3EDB5CBB}']
    function retornarInvestimento(const valorInvestido: double; const ricoProjeto: Integer): Currency;
    function retornarDescricaoRisco(const ricoProjeto: Integer; const lblLabel: TLabel): String;
  end;

implementation

end.
