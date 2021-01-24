unit model.RetornoInvestimento;

interface


uses   Vcl.Graphics, Vcl.StdCtrls, model.RetornoInvestimento.interfaces;

type
  TRetornoInvestimento = Class(TInterfacedObject, IRetornoInvestimento)
  private
  public
    function retornarInvestimento(const valorProjeto: Currency; const valorInvestido: Currency; const ricoProjeto: Integer): Currency;
    function retornarDescricaoRisco(const ricoProjeto: Integer; const lblLabel: TLabel): String;
    //
  end;

implementation

// faz o calculo do retorno se baseando no risco do projeto
function TRetornoInvestimento.retornarInvestimento(const valorProjeto: Currency; const valorInvestido: Currency; const ricoProjeto: Integer): Currency;
var valorRetorno : Currency;
begin
  try
     case ricoProjeto of
        0: begin  // baixo
            valorRetorno  :=  (5 / 100) * valorInvestido;
        end;
        1: begin   // medio
           valorRetorno   :=  (10 / 100) * valorInvestido;
        end;
        else // alto
        begin
           valorRetorno   :=  (20 / 100) * valorInvestido;
        end;
     end;
     //
     result := (valorInvestido) +  valorRetorno;
  except
    result := 0;
  end;
end;



// retorna a descricao do risco para se mostrado na tela
function TRetornoInvestimento.retornarDescricaoRisco(const ricoProjeto: Integer; const lblLabel: TLabel): String;
begin
  try
     case ricoProjeto of
        0: begin
            result  :=  'BAIXO';
            //
            lblLabel.Font.Color := clLime;
        end;
        1: begin
           result   :=  'MÉDIO';
            //
            lblLabel.Font.Color := clYellow;
        end;
        else
        begin
            result   :=  'ALTO';
            //
            lblLabel.Font.Color := clRed;
        end;

     end;
  except
    result := 'NÃO INFORMADO';
  end;
end;

end.
