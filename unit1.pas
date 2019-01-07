unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Zapis: TButton;
    Zav: TLabel;
    na: TEdit;
    Nacitaj: TButton;
    PoradieZ: TEdit;
    Prid: TLabel;
    Zavolaj: TButton;
    Pridaj: TButton;
    Cislo: TEdit;
    Tabula: TMemo;
    Poradie: TEdit;
    procedure ZapisClick(Sender: TObject);
    procedure NacitajClick(Sender: TObject);
    procedure ZavolajClick(Sender: TObject);
    procedure PridajClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;
  a,b,c,d: integer;
  p,q:array of integer;
  t,tz:textfile;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
begin
  a:=0;
  b:=0;
  c:=0;
end;


procedure TForm1.PridajClick(Sender: TObject);
begin
     tabula.Lines.Clear;
     prid.font.color:=clgreen;
     a:=a+1;
     SetLength(p,a);
  if strtoint(poradie.text)=0 then begin
    p[a-1]:=strtoint(cislo.text);
      for c:= 0 to a-1 do tabula.lines.Add(inttostr(p[c]));
      prid.Caption:='Pridany bol zakaznik s cislom ' +cislo.text;
       end
    else begin
      for b:= a-2 downto strtoint(poradie.text)-1 do p[b+1]:=p[b];
      p[strtoint(poradie.text)-1]:=strtoint(cislo.text);
      for c:= 0 to a-1 do tabula.lines.Add(inttostr(p[c]));
      prid.Caption:='Pridany bol zakaznik s cislom ' +cislo.text+ ' na poziciu ' +poradie.text;
    end;


end;

procedure TForm1.NacitajClick(Sender: TObject);
begin
  tabula.Lines.Clear;
  SetLength(p,0);
  a:=0;
  if na.text='SuborZ' then begin
      AssignFile(tz,'C:\Users\Dell\Desktop\SEN\Poradovnik\suborz.txt');
      reset(tz);
         while not eof(tz) do begin
          a:=a+1;
          SetLength(p,a);
          readln(tz,p[a-1]);
          tabula.lines.Add(inttostr(p[a-1]));
         end;
         closefile(tz);
  end
     else begin
         AssignFile(t,'C:\Users\Dell\Desktop\SEN\Poradovnik\subor.txt' );
         reset(t);
         while not eof(t) do begin
          a:=a+1;
          SetLength(p,a);
          readln(t,p[a-1]);
          tabula.lines.Add(inttostr(p[a-1]));
         end;
         closefile(t);
        end;



end;

procedure TForm1.ZapisClick(Sender: TObject);
begin
  d:=0;
  assignfile(tz,'C:\Users\Dell\Desktop\SEN\Poradovnik\suborz.txt');
  rewrite(tz);
  for d:= 0 to length(p)-1 do writeln(tz,p[d]);
  closefile(tz);
end;

procedure TForm1.ZavolajClick(Sender: TObject);
begin
  d:=0;
  tabula.Lines.Clear;
  for d:= strtoint(poradiez.text)-1 to a do p[d]:=p[d+1];
  a:=a-1;
  setlength(p,a);
  for c:= 0 to a-1 do tabula.lines.Add(inttostr(p[c]));
  Zav.font.color:=clgreen;
  Zav.Caption:='Zavolaj zakaznika s cislom '+inttostr(p[strtoint(poradiez.text)-1]);
end;




end.

