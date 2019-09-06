unit UPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Data.DB,
  Vcl.Mask, Vcl.DBCtrls, Datasnap.DBClient, Vcl.ComCtrls, Vcl.Grids, Midas, System.JSON,
  Vcl.DBGrids, REST.Types, REST.Client, REST.Response.Adapter, REST.Backend.EMSServices, Data.Bind.Components,
  REST.Backend.EMSFireDAC, Data.Bind.ObjectScope, System.StrUtils, FireDAC.Comp.DataSet,
  Vcl.AppEvnts,
  IdSMTP, IdSSLOpenSSL, IdMessage, IdText, IdAttachmentFile,IdSASL,IdSASLLogin,IdUserPassProvider,
  IdExplicitTLSClientServerBase;




type
  TFrmCadastro = class(TForm)
    Panel1: TPanel;
    PageControl1: TPageControl;
    TabDados: TTabSheet;
    TabEndereco: TTabSheet;
    TblClientes: TClientDataSet;
    TblClientesId_Cliente: TIntegerField;
    TblClientesNome: TStringField;
    TblClientesIdentidade: TStringField;
    TblClientesCpf: TStringField;
    TblClientesTelefone: TStringField;
    TblClientesEmail: TStringField;
    Label1: TLabel;
    DbeId: TDBEdit;
    DsClientes: TDataSource;
    Label2: TLabel;
    DbeNome: TDBEdit;
    Label3: TLabel;
    DbeIdentidade: TDBEdit;
    Label4: TLabel;
    DbeCpf: TDBEdit;
    Label5: TLabel;
    DbeTel: TDBEdit;
    Label6: TLabel;
    DbeEmail: TDBEdit;
    TblEndereco: TClientDataSet;
    TblEnderecoCep: TStringField;
    TblEnderecoNumero: TIntegerField;
    TblEnderecoComplemento: TStringField;
    TblEnderecoBairro: TStringField;
    TblEnderecoCidade: TStringField;
    TblEnderecoEstado: TStringField;
    TblEnderecoId_Endereco: TIntegerField;
    DsEnderecos: TDataSource;
    Label9: TLabel;
    DbeCep: TDBEdit;
    Label10: TLabel;
    DbeNumero: TDBEdit;
    Label11: TLabel;
    DBEdit11: TDBEdit;
    Label12: TLabel;
    DbeBairro: TDBEdit;
    Label13: TLabel;
    DbeCidade: TDBEdit;
    Label14: TLabel;
    DBEEstado: TDBEdit;
    TblEnderecoLogradouro: TStringField;
    Label15: TLabel;
    DbeLagradouro: TDBEdit;
    DBGrid1: TDBGrid;
    DbClientes: TDBGrid;
    PnlBotoesEnd: TPanel;
    btnIncluirEnd: TButton;
    btnSalvarEnd: TButton;
    BtnAlterarEnd: TButton;
    TblEnderecoId_Cliente: TIntegerField;
    PnlBotoes: TPanel;
    BtnIncluir: TButton;
    btnSalvar: TButton;
    btnApagar: TButton;
    BtnCancelar: TButton;
    btnEnviarEmail: TButton;
    btnFechar: TButton;
    btnAlterar: TButton;
    btnCancelarEnd: TButton;
    RESTClient1: TRESTClient;
    RESTRequest1: TRESTRequest;
    RESTResponse1: TRESTResponse;
    StatusBar1: TStatusBar;
    Label7: TLabel;
    Label8: TLabel;
    TabSheet1: TTabSheet;
    Bevel1: TBevel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    edtervidor: TEdit;
    edtporta: TEdit;
    edtlogin: TEdit;
    edtsenha: TEdit;
    chkRequerAutenticacao: TCheckBox;
    checkSSL: TCheckBox;
    BtnEmail: TButton;
    BtnXml: TButton;
    TblEnderecoPais: TStringField;
    Label21: TLabel;
    DBEdit1: TDBEdit;
    procedure FormShow(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BtnIncluirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnApagarClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure btnIncluirEndClick(Sender: TObject);
    procedure TabEnderecoEnter(Sender: TObject);
    procedure btnSalvarEndClick(Sender: TObject);
    procedure BtnAlterarEndClick(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure DbeCpfExit(Sender: TObject);
    procedure btnCancelarEndClick(Sender: TObject);
    procedure DbeCepExit(Sender: TObject);
    procedure btnEnviarEmailClick(Sender: TObject);
    procedure BtnXmlClick(Sender: TObject);
    procedure DbClientesCellClick(Column: TColumn);

  private
    { Private declarations }
     Procedure LocalizaCep(sTexto:String);
     function  EnviarEmail: Boolean;
     procedure CriarXmlCliente;
  public
    { Public declarations }
    Function cgc_ok (cgc : string): boolean;
    Function cpf_ok (cpf : string): boolean;
    function TiraCaracter(sTexto:String): String;
    function TiraAspas(valor: string): string;
  end;

var
  FrmCadastro: TFrmCadastro;
  iId_Cliente, iId_Ender: integer;

implementation

{$R *.dfm}

procedure TFrmCadastro.btnAlterarClick(Sender: TObject);
begin
  TblClientes.Edit;
  btnSalvar.Enabled := true;
  BtnCancelar.Enabled := true;
  btnApagar.Enabled := true;
  BtnIncluir.Enabled := false;
  btnAlterar.Enabled := false;
  DbeNome.SetFocus;
end;

procedure TFrmCadastro.BtnAlterarEndClick(Sender: TObject);
begin
    DsEnderecos.AutoEdit := true;
    TblEndereco.Edit;
    btnAlterar.Enabled    := false;
    btnIncluirEnd.Enabled := false;
    btnSalvarEnd.Enabled  := true;
end;

procedure TFrmCadastro.btnApagarClick(Sender: TObject);
begin
  if application.MessageBox('Deseja realmente Excluir o registro?', 'Excluind',
    Mb_YesNo + MB_ICONQUESTION) = MrYes then begin

    //Apagar os Endereços primeiro
    TblEndereco.Filtered := false;
    TblEndereco.Filter   := ' Id_cliente = '+TblClientesId_Cliente.AsString;
    TblEndereco.Filtered := true;
    while not TblEndereco.eof do begin
       TblEndereco.Delete;
    end;
    if TblEndereco.RecordCount = 1 then
       TblEndereco.delete;

    //Apagar Cliente
    TblClientes.Delete;

  end;

  btnSalvar.Enabled   := false;
  BtnCancelar.Enabled := false;
  btnApagar.Enabled   := (TblClientes.RecordCount > 0);
  BtnIncluir.Enabled  := true;
  btnAlterar.Enabled  := (TblClientes.RecordCount > 0);
  btnEnviarEmail.Enabled := (TblClientesEmail.AsString <> '');
end;

procedure TFrmCadastro.BtnCancelarClick(Sender: TObject);
begin
  TblClientes.Cancel;
  btnSalvar.Enabled   := false;
  BtnCancelar.Enabled := false;
  btnApagar.Enabled   := (TblClientes.RecordCount > 0);
  BtnIncluir.Enabled  := true;
  btnAlterar.Enabled  := (TblClientes.RecordCount > 0);
  btnEnviarEmail.Enabled := (TblClientesEmail.AsString <> '');
end;

procedure TFrmCadastro.btnCancelarEndClick(Sender: TObject);
begin

   TblEndereco.Cancel;
   btnCancelarEnd.Enabled := false;
   btnIncluirEnd.Enabled  := true;
   BtnAlterarEnd.Enabled  := (TblEndereco.RecordCount > 0);
   DsEnderecos.AutoEdit := false;
end;

procedure TFrmCadastro.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmCadastro.BtnIncluirClick(Sender: TObject);
begin
  TblClientes.Insert;
  TblClientesId_Cliente.Value := iId_Cliente;
  btnSalvar.Enabled := true;
  BtnCancelar.Enabled := true;
  btnApagar.Enabled := true;
  BtnIncluir.Enabled := false;
  btnAlterar.Enabled := false;
  DbeNome.SetFocus;
end;

procedure TFrmCadastro.btnIncluirEndClick(Sender: TObject);
begin
     DsEnderecos.AutoEdit := true;
     TblEndereco.Insert;
     TblEnderecoId_Endereco.Value := iId_Ender;
     TblEnderecoId_Cliente.Value  := TblClientesId_Cliente.Value;
     TblEnderecoPais.Value        := 'BRASIL';
     btnIncluirEnd.Enabled := false;
     btnSalvarEnd.Enabled  := true;
     BtnAlterarEnd.Enabled := false;
     BtnCancelar.Enabled   := true;
     DbeCep.SetFocus;

end;

procedure TFrmCadastro.btnSalvarClick(Sender: TObject);
begin
  if TblClientes.State = dsInsert then
    inc(iId_Cliente);

  try
    TblClientes.Post;
  except
    On E: Exception Do
    Begin
      MessageDlg('Atenção! Falha na gravação dos dados) Erro:'+e.Message, mtError, [mbOK], 0);
    End;
  end;
  btnSalvar.Enabled := false;
  BtnCancelar.Enabled := false;
  btnApagar.Enabled := true;
  BtnIncluir.Enabled := true;
  btnAlterar.Enabled := (TblClientes.RecordCount > 0);
  btnEnviarEmail.Enabled := (TblClientesEmail.AsString <> '');
end;

procedure TFrmCadastro.btnSalvarEndClick(Sender: TObject);
begin
   if DbeCep.text = '     -   ' then begin
      messagedlg('Atenção! Favor informar o CEP ',mtInformation,[mbok],0);
      DbeCep.SetFocus;
      exit;
   end;


    if TblEndereco.State = dsInsert then
       inc(iId_Ender);

    try
      TblEndereco.Post;
    except
      On E: Exception Do
      Begin
        MessageDlg('Atenção! Falha na gravação dos dados) Erro:'+e.Message, mtError, [mbOK], 0);
      End;
    end;

    btnSalvarEnd.enabled  := false;
    btnIncluirEnd.Enabled := true;
    BtnAlterarEnd.Enabled := false;
    DsEnderecos.AutoEdit := false;
end;

procedure TFrmCadastro.BtnXmlClick(Sender: TObject);
var
  Arq  : TextFile;
  iEnd : integer;
begin
  iEnd := 1;

  if TblClientes.RecordCount = 0 then begin
     Messagedlg('Não existem registros para criação do XML',mtWarning,[mbok],0);
     exit;
  end;

  try

     //uma das formas Datapacket
     TblClientes.SaveToFile(ExtractFilePath(Application.ExeName)+'\Clientes_packet.xml');

     //Outra forma criando na Mão
     if FileExists(ExtractFilePath(Application.ExeName) + 'Clientes.xml') then
        DeleteFile(ExtractFilePath(Application.ExeName) + 'Clientes.xml');

     AssignFile(Arq, ExtractFilePath(Application.ExeName) + 'Clientes.xml');
     Rewrite(Arq);

     Tblclientes.First ;
     Writeln(Arq, '<?xml version="1.0" encoding="ISO-8859-1"?>   ');
     while not Tblclientes.eof do begin
        Writeln(Arq, '<Clientes>                                    ');
        Writeln(Arq, '  <Id_Cliente>'+TblClientesId_Cliente.asstring+'</Id_Cliente>                    ');
        Writeln(Arq, '  <Nome>'+TblClientesNome.asstring+'</Nome>                    ');
        Writeln(Arq, '  <Identidade>'+TblClientesIdentidade.asstring+'</Identidade>      ');
        Writeln(Arq, '  <CPF>'+TblClientesCpf.asstring+'</CPF>         ');
        Writeln(Arq, '  <Telefone>'+TblClientesTelefone.asstring+'</Telefone> ');
        Writeln(Arq, '  <Email>'+TblClientesEmail.asstring+'</Email> ');

        TblEndereco.Filtered := false;
        TblEndereco.Filter   := ' Id_cliente = '+TblClientesId_Cliente.AsString;
        TblEndereco.Filtered := true;
        Writeln(Arq, '  <Endereco>                                       ');
        iEnd := 1;
        while not TblEndereco.eof do begin
              Writeln(Arq, '    <End'+inttostr(iEnd)+'>');
              Writeln(Arq, '      <Cep>'+TblEnderecoCep.AsString+'</Cep>         ');   //1 - ambiente de produção
              Writeln(Arq, '      <Logradouro>'+TblEnderecoLogradouro.AsString+'</Logradouro>      ');
              Writeln(Arq, '      <Numero>'+TblEnderecoNumero.AsString+'</Numero>  ');
              Writeln(Arq, '      <Complemento>'+TblEnderecoComplemento.AsString+'</Complemento>                ');
              Writeln(Arq, '      <Bairro>'+TblEnderecoBairro.AsString+'</Bairro>   ');
              Writeln(Arq, '      <Cidade>'+TblEnderecoCidade.AsString+'</Cidade>   ');
              Writeln(Arq, '      <Estado>'+TblEnderecoEstado.AsString+'</Estado>   ');
              Writeln(Arq, '      <Pais>'+TblEnderecoPais.AsString+'</Pais>   ');
              Writeln(Arq, '    </End'+inttostr(iEnd)+'>');
            TblEndereco.next;
            inc(iEnd);
        end;
        Writeln(Arq, '  </Endereco>  ');
        Writeln(Arq, '</Clientes>                                    ');

        TblClientes.Next;
    end;
    CloseFile(Arq);
  except
   On E: Exception Do
      Begin
        MessageDlg('Atenção! Falha no Processo da Geração do XML. Erro:'+e.Message, mtError, [mbOK], 0);
      End;

  end;
  if FileExists(ExtractFilePath(Application.ExeName) + 'Clientes.xml') then
     Messagedlg(' Arquivo Gerado com Sucesso ',mtInformation,[mbok],0)
  Else
     Messagedlg(' Arquivo NÃO foi Gerado. ',mtWarning,[mbok],0)

end;

procedure TFrmCadastro.CriarXmlCliente;
var
  Arq  : TextFile;
  iEnd : integer;
begin
  iEnd := 1;

  if TblClientes.RecordCount = 0 then begin
     Messagedlg('Não existem registros para criação do XML',mtWarning,[mbok],0);
     exit;
  end;

  try

     if FileExists(ExtractFilePath(Application.ExeName) + 'Clientes'+TblClientesId_Cliente.AsString+'.xml') then
        DeleteFile(ExtractFilePath(Application.ExeName) + 'Clientes'+TblClientesId_Cliente.AsString+'.xml');

     AssignFile(Arq, ExtractFilePath(Application.ExeName) + 'Clientes'+TblClientesId_Cliente.AsString+'.xml');
     Rewrite(Arq);

     Writeln(Arq, '<?xml version="1.0" encoding="ISO-8859-1"?>   ');
     Writeln(Arq, '<Clientes>                                    ');
     Writeln(Arq, '  <Id_Cliente>'+TblClientesId_Cliente.asstring+'</Id_Cliente>                    ');
     Writeln(Arq, '  <Nome>'+TblClientesNome.asstring+'</Nome>                    ');
     Writeln(Arq, '  <Identidade>'+TblClientesIdentidade.asstring+'</Identidade>      ');
     Writeln(Arq, '  <CPF>'+TblClientesCpf.asstring+'</CPF>         ');
     Writeln(Arq, '  <Telefone>'+TblClientesTelefone.asstring+'</Telefone> ');
     Writeln(Arq, '  <Email>'+TblClientesEmail.asstring+'</Email> ');

     TblEndereco.Filtered := false;
     TblEndereco.Filter   := ' Id_cliente = '+TblClientesId_Cliente.AsString;
     TblEndereco.Filtered := true;
     Writeln(Arq, '  <Endereco>                                       ');
     iEnd := 1;
      while not TblEndereco.eof do begin
            Writeln(Arq, '    <End'+inttostr(iEnd)+'>');
            Writeln(Arq, '      <Cep>'+TblEnderecoCep.AsString+'</Cep>         ');   //1 - ambiente de produção
            Writeln(Arq, '      <Logradouro>'+TblEnderecoLogradouro.AsString+'</Logradouro>      ');
            Writeln(Arq, '      <Numero>'+TblEnderecoNumero.AsString+'</Numero>  ');
            Writeln(Arq, '      <Complemento>'+TblEnderecoComplemento.AsString+'</Complemento>                ');
            Writeln(Arq, '      <Bairro>'+TblEnderecoBairro.AsString+'</Bairro>   ');
            Writeln(Arq, '      <Cidade>'+TblEnderecoCidade.AsString+'</Cidade>   ');
            Writeln(Arq, '      <Estado>'+TblEnderecoEstado.AsString+'</Estado>   ');
            Writeln(Arq, '      <Pais>'+TblEnderecoPais.AsString+'</Pais>   ');
            Writeln(Arq, '    </End'+inttostr(iEnd)+'>');
          TblEndereco.next;
          inc(iEnd);
      end;
      Writeln(Arq, '  </Endereco>  ');
      Writeln(Arq, '</Clientes>                                    ');

      CloseFile(Arq);
  except
   On E: Exception Do
      Begin
        MessageDlg('Atenção! Falha no Processo da Geração do XML. Erro:'+e.Message, mtError, [mbOK], 0);
      End;

  end;

end;

procedure TFrmCadastro.btnEnviarEmailClick(Sender: TObject);
begin
    if TblClientesEmail.AsString <> '' then begin
       CriarXmlCliente; //Criar o arqurivo XML do cliente espefífico
       if EnviarEmail then
          MessageDlg('Confirmação! Enviado com sucesso',mtInformation,[mbok],0)
       else
          MessageDlg('Falha! Não foi enviado e-mail',mtError,[mbok],0);

    end;
end;

function TFrmCadastro.EnviarEmail : Boolean;
var
   IdSMTP    : TIdSMTP;
   IdMessage : TIdMessage;
           I : Integer;
   idSASLogin: TIdSASLLogin;
   idUserPassProv: TIdUserPassProvider;
   AuthSSL : TIdSSLIOHandlerSocketOpenSSL;
   sItenCupom : string;
begin
    Result := False;

    IdSMTP                          := TIdSMTP.Create(nil);
    IdMessage                       := TIdMessage.Create(nil);
    idSASLogin                      := TIdSASLLogin.Create(nil);
    idUserPassProv                  := TIdUserPassProvider.Create(nil);
    idSASLogin.UserPassProvider     := idUserPassProv;
    AuthSSL                         := TIdSSLIOHandlerSocketOpenSSL.Create(nil);

    Try
        IdSMTP.Host                   := edtervidor.text;
        IdSMTP.Port                   := strtoint(edtporta.Text);

        IdSMTP.AuthType               := satDefault;
        IdSMTP.Username               := edtlogin.text;
        IdSMTP.Password               := edtsenha.text;
        idUserPassProv.Username       := edtlogin.text;
        idUserPassProv.Password       := edtsenha.text;
        IdSMTP.ConnectTimeout         := 6000;
        IdSMTP.ReadTimeout            := 6000;
        AuthSSL.ReadTimeout           := 30000;

        AuthSSL.SSLOptions.Method     := sslvTLSv1;
        AuthSSL.SSLOptions.Mode       := sslmUnassigned;
        AuthSSL.PassThrough           := true;

        IdSMTP.IOHandler              := TIdSSLIOHandlerSocketOpenSSL.Create(IdSMTP);
        IdSMTP.UseTLS                 := utUseExplicitTLS;
        With TIdSSLIOHandlerSocketOpenSSL(idSmtp.IOHandler) Do
        Begin
          SSLOptions.Method           := sslvTLSv1;
          PassThrough                 := True;
          SSLOptions.Mode             := sslmUnassigned;
          ReadTimeout                 := 30000;
        End;

        IdSMTP.AuthType                := satSASL;         // bol opcao default
        IdSMTP.SASLMechanisms.Add.SASL := idSASLogin;

        If checkSSL.Checked then
        begin
          AuthSSL.SSLOptions.Method := sslvSSLv3;
          AuthSSL.SSLOptions.Mode   := sslmClient;

          IdSMTP.UseTLS                := utUseImplicitTLS;
          With TIdSSLIOHandlerSocketOpenSSL(idSmtp.IOHandler) Do
            SSLOptions.Mode            := sslmClient;

          IdSMTP.AuthType              := satDefault;
          IdSMTP.SASLMechanisms.Clear;
        End;

        Try
          AuthSSL.StartSSL;
          IdSMTP.Connect;
          If chkRequerAutenticacao.Checked then
            IdSMTP.Authenticate;

          IdMessage.From.Address               := edtlogin.Text ;
          IdMessage.Recipients.EMailAddresses  := TblClientesEmail.AsString;

          IdMessage.Subject                  := ' TESTE DE ENVIO DE EMAIL PELO SISTEMA INFOSISTEMAS '+formatdatetime('dd/mm/yyyy hh:mm:ss',now);

          IdMessage.MessageParts.Clear; // Limpa os anexos da lista
          //IdMessage.ContentType := 'text/html';
          IdMessage.Body.Clear;
          IdMessage.Body.text := ' TESTE DE ENVIO EMAIL PELO SISTEMA INFOSISTEMAS '+#13+
                                 ' NOME     : '+TblClientesNome.AsString+#13+
                                 ' TELEFONE : '+TblClientesTelefone.AsString+#13+
                                 ' IDENTID..: '+TblClientesIdentidade.AsString;

          If FileExists(ExtractFilePath(Application.ExeName) + 'Clientes'+TblClientesId_Cliente.AsString+'.xml') then
                  TIdAttachmentFile.Create(IdMessage.MessageParts, TFileName(ExtractFilePath(Application.ExeName) + 'Clientes'+TblClientesId_Cliente.AsString+'.xml'));

          sleep(500);
          IdSMTP.Send(IdMessage);
          SetForegroundWindow(Application.Handle);
          Result:= True;

        Except
          On E: Exception do
          begin
            SetForegroundWindow(Application.Handle);
            MessageDlg('Ocorreu um erro ao tentar enviar o e-mail.' +#13+' Motivo: '+e.Message, mtError, [mbOK],0);
            Result := false;
            Exit;
          End;
        End;
      Finally
        IdSMTP.Disconnect;
        FreeAndNil(IdSMTP);
        FreeAndNil(IdMessage);
        FreeAndNil(AuthSSL);
      End;

end;

procedure TFrmCadastro.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  TblClientes.Close;
  TblEndereco.Close;
end;

procedure TFrmCadastro.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) then
  begin
    try
      TForm(Sender).Perform(WM_NEXTDLGCTL, 0, 0);
      Key := #0;
    Except
    end;
  end;

end;

procedure TFrmCadastro.FormShow(Sender: TObject);
begin
  iId_Cliente := 1;
  TblClientes.Close;
  TblClientes.CreateDataSet;
  TblClientes.Open;

  TblEndereco.Close;
  TblEndereco.CreateDataSet;
  TblEndereco.Open;

  PageControl1.ActivePageIndex  := 0;
end;

procedure TFrmCadastro.PageControl1Change(Sender: TObject);
begin
    if (PageControl1.ActivePageIndex  = 1) and (TblClientesId_Cliente.AsString = '') then begin
       PageControl1.ActivePageIndex  := 0;
       BtnIncluir.SetFocus;
       exit;
    end;

    if (PageControl1.ActivePageIndex  = 1) then begin
       TblEndereco.Filtered := false;
       TblEndereco.Filter   := ' Id_cliente = '+TblClientesId_Cliente.AsString;
       TblEndereco.Filtered := true;
       TblEndereco.Last;
       iId_Ender := TblEnderecoId_Endereco.Value;
       if iId_Ender =0 then
          iId_Ender := 1;
    end;
end;

procedure TFrmCadastro.TabEnderecoEnter(Sender: TObject);
begin
    if TblClientes.State <> dsbrowse then
       btnSalvar.OnClick(nil);

    if TblClientesId_Cliente.AsString = '' then begin
       PageControl1.ActivePageIndex  := 0;
       BtnIncluir.SetFocus;
       exit;
    end;

    TblEndereco.Filtered := false;
    TblEndereco.Filter   := ' Id_cliente = '+TblClientesId_Cliente.AsString;
    TblEndereco.Filtered := true;
    TblEndereco.Last;
    iId_Ender := TblEnderecoId_Endereco.Value;
    if iId_Ender =0 then
       iId_Ender := 1;



end;

Function TFrmCadastro.cpf_ok (cpf : string): boolean;
var i, j, dv1, dv2 : integer;
Begin
  if CPF = '' then Abort;

  i  :=01;
  j  :=11;
  dv1:=00;
  dv2:=00;
  while i <= 9 do
    begin
      dv1:=dv1+strtoint(cpf[i]) * (j-1);
      dv2:=dv2+strtoint(cpf[i]) * j;
      i:=i+1;
      j:=j-1;
    end;
  dv2:= dv2+strtoint(cpf[i]) * j;
  dv1:= 11 - (dv1 MOD 11);
  if dv1 > 9 then dv1:=0;
  dv2:= 11 - (dv2 mod 11);
  if dv2 > 9 then dv2:=0;

  if (cpf[10] <> inttostr(dv1)) or (cpf[11] <> inttostr(dv2)) then
     begin
       messagedlg('CPF inválido. Verifique, Por Favor.',mtWarning,[mbOK],0);
       cpf_ok:=false;
     end
  else
     cpf_ok:=true;
end;
procedure TFrmCadastro.DbClientesCellClick(Column: TColumn);
begin
  btnEnviarEmail.Enabled := (TblClientesEmail.AsString <> '');
end;

procedure TFrmCadastro.DbeCepExit(Sender: TObject);
begin
    if (DbeCep.Text <> '') and (TblEndereco.State <> dsbrowse) then
       LocalizaCep(DbeCep.Text);

end;

procedure TFrmCadastro.DbeCpfExit(Sender: TObject);
begin
    if DbeCpf.text = '' then
       exit;

    if length(TiraCaracter(trim(DbeCpf.Text))) = 11 then
    begin
      if not cpf_OK(TiraCaracter(trim(DbeCpf.Text))) then
      begin
        DbeCpf.SetFocus;
        Abort;
      end;
      if DbeCpf.Text = '00000000000' then begin
         messagedlg('CPF inválido. Verifique, Por Favor.',mtWarning,[mbOK],0);
         DbeCpf.SetFocus;
         Abort;
      end;

    end
    else
    if length(TiraCaracter(trim(DbeCpf.Text))) = 14 then
    begin
      if not cgc_OK(TiraCaracter(trim(DbeCpf.Text))) then
      begin
        DbeCpf.SetFocus;
        Abort;
      end;
      if DbeCpf.Text = '00000000000000' then begin
         messagedlg('CNPJ inválido. Verifique, Por Favor.',mtWarning,[mbOK],0);
         DbeCpf.SetFocus;
         Abort;
      end;

    end
    else
    begin
      messagedlg('            Atenção!            '+#13+
                 ' CNPJ/CPF Inválido.Verifique! ',mtWarning,[mbOK],0);
      DbeCpf.SetFocus;
      Abort;
    end;
end;

{=============================================================================}

Function TFrmCadastro.cgc_ok (cgc : string): boolean;
Var i, j, dv1 : integer;

Begin
  if CGC = '' then Abort;
  j:=5;
  dv1:=0;
  for i:=1 to 12 do
    begin
      if j < 2 then j:=9;
      dv1:=dv1 + strtoint(cgc[i]) * j;
      j:=j-1;
    end;
  dv1:= 11 - dv1 mod 11;
  if dv1 > 9 then dv1:=0;
  if inttostr(dv1) <> cgc[13] then
     begin
       messagedlg('CGC invalido',mtWarning,[mbOK],0);
       cgc_ok:=false;
       exit;
     end;

  j:=6;
  dv1:=0;
  for i:=1 to 13 do
    begin
      if j < 2 then j:=9;
      dv1:=dv1 + strtoint(cgc[i]) * j;
      j:=j-1;
    end;
  dv1:= 11 - dv1 mod 11;
  if dv1 > 9 then dv1:=0;
  if inttostr(dv1) <> cgc[14] then
     begin
       messagedlg('CNPJ inválido. Verifique, por favor.',mtWarning,[mbOK],0);
       cgc_ok:=false;
       exit;
     end;
  cgc_ok:=true;
end;

function TFrmCadastro.TiraCaracter(sTexto:String): String;
var
  Temp_01 : string;
  Temp_03, conta: Integer;
begin
  Conta := 0;
  Temp_03 := length(sTexto);

  while conta < temp_03 do
   begin
     Conta := Conta + 1;
     Temp_01 := Copy(Stexto,conta,1);

     if Temp_01 = '.' then
      begin
        sTexto := Copy(sTexto,1,(Conta - 1))+ Copy(sTexto,(Conta + 1),(Temp_03 - Conta));
      end;

     if Temp_01 = ',' then
      begin
        sTexto := Copy(sTexto,1,(Conta - 1))+ Copy(sTexto,(Conta + 1),(Temp_03 - Conta));
      end;

     if Temp_01 = '-' then
      begin
        sTexto := Copy(sTexto,1,(Conta - 1))+ Copy(sTexto,(Conta + 1),(Temp_03 - Conta));
      end;

     if Temp_01 = '/' then
      begin
        sTexto := Copy(sTexto,1,(Conta - 1))+ Copy(sTexto,(Conta + 1),(Temp_03 - Conta));
      end;

     if Temp_01 = '(' then
      begin
        sTexto := Copy(sTexto,1,(Conta - 1))+ Copy(sTexto,(Conta + 1),(Temp_03 - Conta));
      end;

     if Temp_01 = ')' then
      begin
        sTexto := Copy(sTexto,1,(Conta - 1))+ Copy(sTexto,(Conta + 1),(Temp_03 - Conta));
      end;

     if Temp_01 = '&' then
      begin
        sTexto := Copy(sTexto,1,(Conta - 1))+ Copy(sTexto,(Conta + 1),(Temp_03 - Conta));
      end;

   end;

  Result := sTexto;
end;

Procedure TFrmCadastro.LocalizaCep(sTexto:String);
var
   jsonObj : TJSONObject;

begin
  try
     StatusBar1.Panels[0].Text := 'Consultando : viacep.com.br/ws/'+TiraCaracter(DbeCep.Text)+'/json/';
     RESTClient1.BaseURL := 'viacep.com.br/ws/'+TiraCaracter(DbeCep.Text)+'/json/';
     RESTRequest1.Execute ;
     StatusBar1.Panels[0].Text := StatusBar1.Panels[0].Text +' Retorno : '+inttostr(RESTResponse1.StatusCode);
     if RESTResponse1.StatusCode = 200 then begin

        JsonObJ := TJSONObject.ParseJSONValue(TEncoding.UTF8.GetBytes(RESTResponse1.JSONText), 0) as TJSONObject;

        try
          TblEnderecoLogradouro.Value:= TiraAspas( UpperCase( trim(JsonObj.Values['logradouro'].toString)));
          TblEnderecoBairro.Value    := TiraAspas( UpperCase( trim(JsonObj.Values['bairro'].toString)));
          TblEnderecoCidade.value    := TiraAspas( UpperCase( trim(JsonObj.Values['localidade'].toString)));
          TblEnderecoEstado.Value    := TiraAspas( UpperCase( trim(JsonObj.Values['uf'].toString)));


        Except
          StatusBar1.Panels[0].Text := 'Não encontrado endereço';
        end;
     end;

  finally
    jsonObj.Free;
  end;
end;

function TFrmCadastro.TiraAspas(valor: string): string;
var i: integer;
begin
   for i := 0 to Length(valor) do
      begin
         if valor[i]='"' then
            begin
               delete(valor,i,1);
            end
         end;
Result := valor;
end;


end.
