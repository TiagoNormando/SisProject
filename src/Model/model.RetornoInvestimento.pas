unit model.RetornoInvestimento;

interface


uses   Vcl.Graphics, Vcl.StdCtrls, model.RetornoInvestimento.interfaces;

type
  TRetornoInvestimento = Class(TInterfacedObject, IRetornoInvestimento)
  private
  public
    function retornarInvestimento(const valorInvestido: Currency; const ricoProjeto: Integer): Currency;
    function retornarDescricaoRisco(const ricoProjeto: Integer; const lblLabel: TLabel): String;
    //
  end;

implementation

// faz o calculo do retorno se baseando no risco do projeto
function TRetornoInvestimento.retornarInvestimento(const valorInvestido: Currency; const ricoProjeto: Integer): Currency;
begin
  try
     case ricoProjeto of
        0: begin  // baixo
            result  :=  (5 / 100) * valorInvestido;
        end;
        1: begin   // medio
           result   :=  (10 / 100) * valorInvestido;
        end;
        else // alto
        begin
           result   :=  (20 / 100) * valorInvestido;
        end;

     end;
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
           result   :=  'M�DIO';
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
    result := 'N�O INFORMADO';
  end;
end;

end.
