unit Classe.Animal;

interface

type
  TAnimal = class
    function Voz: String; virtual; abstract;
  end;

  TCachorro = class(TAnimal)
    function Voz: String; override;
  end;

  TGato = class(TAnimal)
    function Voz: String; override;
  end;

  TDinossauro = class(TAnimal)
    function Voz: String; override; final; // final - indica que o método não pode mais ser sobreescrito
  end;

  TTiranossauro = class sealed (TDinossauro) // sealed - indica que a classe não pode ser mais herdada ou especializada

  end;

implementation

{ TCachorro }

function TCachorro.Voz: String;
begin
  Result := 'Au au';
end;

{ TGato }

function TGato.Voz: String;
begin
  Result := 'Miau';
end;

{ TDinossauro }

function TDinossauro.Voz: String;
begin
  Result := 'rhaaaa';
end;

end.
