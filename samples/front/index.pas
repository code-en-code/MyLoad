unit index;

interface

uses
  //delphi
  System.SysUtils,
  System.Types,
  System.UITypes,
  System.Classes,
  System.Variants,
  System.UIConsts,

  //fmx
  FMX.Types,
  FMX.Controls,
  FMX.Forms,
  FMX.Graphics,
  FMX.Dialogs,
  FMX.Layouts,
  FMX.Objects,
  FMX.Controls.Presentation,
  FMX.StdCtrls,
  FMX.Edit,
  FMX.Ani,
  FMX.TabControl,

  //codeencode
  myload;

type
  TIndexView = class(TForm)
    Timer1: TTimer;
    lytPage1Col1: TLayout;
    lytPage1Col2: TLayout;
    lytPage1Col3: TLayout;
    lytPage1Col4: TLayout;
    lytPage1Col5: TLayout;
    lytPage1Col6: TLayout;
    vsbPage1: TVertScrollBox;
    lytPage1Line1: TLayout;
    lytPage1Line2: TLayout;
    lytPage1Line3: TLayout;
    lytPage1Col7: TLayout;
    lytPage1Col8: TLayout;
    lytPage1Col9: TLayout;
    tbcBody: TTabControl;
    tabPage1: TTabItem;
    tabPage2: TTabItem;
    lytPage1Buttons1: TLayout;
    btnPage1Load1: TButton;
    lytPage1Load1: TLayout;
    lytPage1Buttons2: TLayout;
    lytPage1Load2: TLayout;
    btnPage1Load2: TButton;
    lytPage1Buttons3: TLayout;
    lytPage1Load3: TLayout;
    btnPage1Load3: TButton;
    lytPage1Buttons4: TLayout;
    lytPage1Load4: TLayout;
    lytPage1Buttons5: TLayout;
    lytPage1Load5: TLayout;
    lytPage1Buttons6: TLayout;
    lytPage1Load6: TLayout;
    lytPage1Buttons7: TLayout;
    lytPage1Load7: TLayout;
    lytPage1Buttons8: TLayout;
    lytPage1Load8: TLayout;
    lytPage1Buttons9: TLayout;
    lytPage1Load9: TLayout;
    btnPage1Load4: TButton;
    btnPage1Load5: TButton;
    btnPage1Load6: TButton;
    btnPage1Load7: TButton;
    btnPage1Load8: TButton;
    btnPage1Load9: TButton;
    btnPage1Stop2: TButton;
    btnPage1Text2: TButton;
    btnPage1Stop3: TButton;
    btnPage1ModeA3: TButton;
    btnPage1Text4: TButton;
    btnPage1Style4: TButton;
    btnPage1Stop4: TButton;
    btnPage1Box5: TButton;
    btnPage1Stop5: TButton;
    btnPage1TextOne6: TButton;
    btnPage1TextTwo6: TButton;
    btnPage1Stop6: TButton;
    btnPage1Box7: TButton;
    btnPage1Stop7: TButton;
    btnPage1Align8: TButton;
    btnPage1Stop8: TButton;
    btnPage1TextOne9: TButton;
    btnPage1TextTwo9: TButton;
    btnPage1Stop9: TButton;
    btnPage1ModeB3: TButton;
    btnPage1Radius7: TButton;
    lytPage1Line4: TLayout;
    lytPage1Col10: TLayout;
    lytPage1Buttons10: TLayout;
    btnPage1Load10: TButton;
    btnPage1ProgressHalf10: TButton;
    btnPage1Stop10: TButton;
    btnPage1ProgressFull10: TButton;
    lytPage1Load10: TLayout;
    lytPage1Col11: TLayout;
    lytPage1Buttons11: TLayout;
    btnPage1Load11: TButton;
    btnPage1ProgressHalf11: TButton;
    btnPage1Stop11: TButton;
    btnPage1ProgressFull11: TButton;
    lytPage1Load11: TLayout;
    lytPage1Col12: TLayout;
    lytPage1Buttons12: TLayout;
    btnPage1Load12: TButton;
    btnPage1Stop12: TButton;
    lytPage1Load12: TLayout;
    Timer2: TTimer;
    procedure btnPage1Load1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure btnPage1Load2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnPage1Load3Click(Sender: TObject);
    procedure btnPage1Load4Click(Sender: TObject);
    procedure btnPage1Load5Click(Sender: TObject);
    procedure btnPage1Load6Click(Sender: TObject);
    procedure btnPage1Load7Click(Sender: TObject);
    procedure btnPage1Load8Click(Sender: TObject);
    procedure btnPage1Load9Click(Sender: TObject);
    procedure btnPage1Stop2Click(Sender: TObject);
    procedure btnPage1Text2Click(Sender: TObject);
    procedure btnPage1Stop3Click(Sender: TObject);
    procedure btnPage1ModeA3Click(Sender: TObject);
    procedure btnPage1Text4Click(Sender: TObject);
    procedure btnPage1Style4Click(Sender: TObject);
    procedure btnPage1Stop4Click(Sender: TObject);
    procedure btnPage1Box5Click(Sender: TObject);
    procedure btnPage1Stop5Click(Sender: TObject);
    procedure btnPage1TextOne6Click(Sender: TObject);
    procedure btnPage1TextTwo6Click(Sender: TObject);
    procedure btnPage1Stop6Click(Sender: TObject);
    procedure btnPage1Box7Click(Sender: TObject);
    procedure btnPage1Stop7Click(Sender: TObject);
    procedure btnPage1Align8Click(Sender: TObject);
    procedure btnPage1Stop8Click(Sender: TObject);
    procedure btnPage1TextOne9Click(Sender: TObject);
    procedure btnPage1TextTwo9Click(Sender: TObject);
    procedure btnPage1Stop9Click(Sender: TObject);
    procedure btnPage1ModeB3Click(Sender: TObject);
    procedure btnPage1Radius7Click(Sender: TObject);
    procedure btnPage1Load10Click(Sender: TObject);
    procedure btnPage1ProgressHalf10Click(Sender: TObject);
    procedure btnPage1ProgressFull10Click(Sender: TObject);
    procedure btnPage1Stop10Click(Sender: TObject);
    procedure btnPage1Load11Click(Sender: TObject);
    procedure btnPage1ProgressHalf11Click(Sender: TObject);
    procedure btnPage1ProgressFull11Click(Sender: TObject);
    procedure btnPage1Stop11Click(Sender: TObject);
    procedure btnPage1Load12Click(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure btnPage1Stop12Click(Sender: TObject);
  private
    { Private declarations }
    FText: String;
    FValue: Double;
    FLoad1: IMyLoad;
    FLoad2: IMyLoad;
    FLoad3: IMyLoad;
    FLoad4: IMyLoad;
    FLoad5: IMyLoad;
    FLoad6: IMyLoad;
    FLoad7: IMyLoad;
    FLoad8: IMyLoad;
    FLoad9: IMyLoad;
    FLoad10: IMyLoad;
    FLoad11: IMyLoad;
    FLoad12: IMyLoad;
  public
    { Public declarations }
  end;

var
  IndexView: TIndexView;

implementation

{$R *.fmx}

procedure TIndexView.FormDestroy(Sender: TObject);
begin
  FLoad1.Hide(True);
  FLoad2.Hide(True);
  FLoad3.Hide(True);
  FLoad4.Hide(True);
  FLoad5.Hide(True);
  FLoad6.Hide(True);
  FLoad7.Hide(True);
  FLoad8.Hide(True);
  FLoad9.Hide(True);
  FLoad10.Hide(True);
  FLoad11.Hide(True);
  FLoad12.Hide(True);
end;

procedure TIndexView.FormShow(Sender: TObject);
begin
  FValue := 0;
  FLoad1 := TMyLoad.New;
  FLoad2 := TMyLoad.New;
  FLoad3 := TMyLoad.New;
  FLoad4 := TMyLoad.New;
  FLoad5 := TMyLoad.New;
  FLoad6 := TMyLoad.New;
  FLoad7 := TMyLoad.New;
  FLoad8 := TMyLoad.New;
  FLoad9 := TMyLoad.New;
  FLoad10 := TMyLoad.New;
  FLoad11 := TMyLoad.New;
  FLoad12 := TMyLoad.New;
end;

procedure TIndexView.btnPage1Load1Click(Sender: TObject);
begin
  FText := 'Loading';
  FLoad1.Show(lytPage1Load1, FText);
  Timer1.Enabled := True;
end;

procedure TIndexView.Timer1Timer(Sender: TObject);
begin
  if FLoad1.IsShowing then
  begin
    FText := FText + ' Loading';
    FLoad1.SetText(FText);
    if FText.Length > 200 then
    begin
      FLoad1.Hide;
      Timer1.Enabled := False;
    end;
  end;
end;

procedure TIndexView.btnPage1Load2Click(Sender: TObject);
begin
  FLoad2.Show(lytPage1Load2, 'Loading products');
end;

procedure TIndexView.btnPage1Stop2Click(Sender: TObject);
begin
  if FLoad2.IsShowing then
    FLoad2.Hide;
end;

procedure TIndexView.btnPage1Text2Click(Sender: TObject);
begin
  if FLoad2.IsShowing then
    FLoad2.SetText('Processing data');
end;

procedure TIndexView.btnPage1Load3Click(Sender: TObject);
begin
  FLoad3
    .Parameters
      .Text
        .Visible__(False)
      .EndText
    .EndParameters
    .Show(lytPage1Load3);
end;

procedure TIndexView.btnPage1Stop3Click(Sender: TObject);
begin
  if FLoad3.IsShowing then
    FLoad3.Hide;
end;

procedure TIndexView.btnPage1ModeA3Click(Sender: TObject);
begin
  FLoad3
    .Parameters
      .Circle
        .ActivateBg(True)
        .ColorBg(StringToAlphaColor('Darkslateblue'))
        .ColorArc(StringToAlphaColor('White'))
        .Shadow_(True)
        .Size(50)
        .Thickness(4)
      .EndCircle
      .Text
        .Visible__(False)
      .EndText
    .EndParameters
    .Show(lytPage1Load3);
end;

procedure TIndexView.btnPage1ModeB3Click(Sender: TObject);
begin
  FLoad3
    .Parameters
      .Circle
        .ActivateBg(False)
        .ColorArc(StringToAlphaColor('White'))
        .Shadow_(True)
        .Size(50)
        .Thickness(4)
      .EndCircle
      .Text
        .Visible__(False)
      .EndText
    .EndParameters
    .Show(lytPage1Load3);
end;

procedure TIndexView.btnPage1Load4Click(Sender: TObject);
begin
  FLoad4
    .Parameters
      .Circle
        .Visible_(False)
      .EndCircle
      .Text
        .Shadow___(True)
        .Size_(15)
        .Visible__(True)
      .EndText
    .EndParameters
    .Show(lytPage1Load4, 'Loading products');
end;

procedure TIndexView.btnPage1Text4Click(Sender: TObject);
begin
  if FLoad4.IsShowing then
    FLoad4.SetText('Processing data');
end;

procedure TIndexView.btnPage1Style4Click(Sender: TObject);
begin
  FLoad4
    .Parameters
      .Text
        .Shadow___(False)
        .Size_(30)
        .Color__($FF708090)
        .Styles([TFontStyle.fsBold])
      .EndText
    .EndParameters;
end;

procedure TIndexView.btnPage1Stop4Click(Sender: TObject);
begin
  if FLoad4.IsShowing then
    FLoad4.Hide;
end;

procedure TIndexView.btnPage1Load5Click(Sender: TObject);
begin
  FLoad5
    .Parameters
      .Box
        .Shadow(True)
        .Color_($FF708090)
        .Visible(True)
      .EndBox
    .EndParameters
    .Show(lytPage1Load5, 'Loading products');
end;

procedure TIndexView.btnPage1Box5Click(Sender: TObject);
begin
  FLoad5
    .Parameters
      .Box
        .Visible(False)
      .EndBox
    .EndParameters;
end;

procedure TIndexView.btnPage1Stop5Click(Sender: TObject);
begin
  if FLoad5.IsShowing then
    FLoad5.Hide;
end;

procedure TIndexView.btnPage1Load6Click(Sender: TObject);
begin
  FLoad6
    .Parameters
      .Box
        .Color_($FF708090)
        .Shadow(True)
        .Visible(True)
      .EndBox
      .Circle
        .Visible_(False)
      .EndCircle
    .EndParameters
    .Show(lytPage1Load6, 'Loading products');
end;

procedure TIndexView.btnPage1TextOne6Click(Sender: TObject);
begin
  if FLoad6.IsShowing then
    FLoad6.SetText('Processing data');
end;

procedure TIndexView.btnPage1TextTwo6Click(Sender: TObject);
begin
  if FLoad6.IsShowing then
    FLoad6.SetText('Just one more moment');
end;

procedure TIndexView.btnPage1Stop6Click(Sender: TObject);
begin
  if FLoad6.IsShowing then
    FLoad6.Hide;
end;

procedure TIndexView.btnPage1Load7Click(Sender: TObject);
begin
  FLoad7
    .Parameters
      .Box
        .Color_($FF708090)
        .Shadow(True)
        .Visible(True)
      .EndBox
      .Text
        .Visible__(False)
      .EndText
    .EndParameters
    .Show(lytPage1Load7);
end;

procedure TIndexView.btnPage1Box7Click(Sender: TObject);
begin
  FLoad7
    .Parameters
      .Box
        .Color_($EE555555)
      .EndBox
    .EndParameters;
end;

procedure TIndexView.btnPage1Radius7Click(Sender: TObject);
begin
  FLoad7
    .Parameters
      .Box
        .CornerRadius(0)
      .EndBox
    .EndParameters;
end;

procedure TIndexView.btnPage1Stop7Click(Sender: TObject);
begin
  if FLoad7.IsShowing then
    FLoad7.Hide;
end;

procedure TIndexView.btnPage1Load8Click(Sender: TObject);
begin
  FLoad8
    .Parameters
      .Box
        .Color_($FF708090)
        .Visible(True)
      .EndBox
      .Circle
        .Visible_(False)
      .EndCircle
      .Text
        .AnimationEllipsis(True)
        .Shadow___(True)
        .Size_(18)
        .HorzAlign(TTextAlign.Leading)
      .EndText
    .EndParameters
    .Show(lytPage1Load8, 'Loading products');
end;

procedure TIndexView.btnPage1Align8Click(Sender: TObject);
begin
  FLoad8
    .Parameters
      .Text
        .HorzAlign(TTextAlign.Center)
      .EndText
    .EndParameters;
end;

procedure TIndexView.btnPage1Stop8Click(Sender: TObject);
begin
  if FLoad8.IsShowing then
    FLoad8.Hide;
end;

procedure TIndexView.btnPage1Load9Click(Sender: TObject);
begin
  FLoad9
    .Parameters
      .Circle
        .Visible_(False)
      .EndCircle
      .Text
        .AnimationEllipsis(True)
        .Shadow___(True)
        .Size_(18)
        .HorzAlign(TTextAlign.Center)
      .EndText
    .EndParameters
    .Show(lytPage1Load9, 'Loading products');
end;

procedure TIndexView.btnPage1TextOne9Click(Sender: TObject);
begin
  if FLoad9.IsShowing then
    FLoad9.SetText('Processing data');
end;

procedure TIndexView.btnPage1TextTwo9Click(Sender: TObject);
begin
  if FLoad9.IsShowing then
    FLoad9.SetText('Just one more moment');
end;

procedure TIndexView.btnPage1Stop9Click(Sender: TObject);
begin
  if FLoad9.IsShowing then
    FLoad9.Hide;
end;

procedure TIndexView.btnPage1Load10Click(Sender: TObject);
begin
  FLoad10
    .Parameters
      .Circle
        .Visible_(False)
      .EndCircle
      .Progress
        .Shadow__(True)
        .Visible___(True)
      .EndProgress
      .Text
        .Shadow___(True)
      .EndText
    .EndParameters
    .Show(lytPage1Load10, 'Loading products');
end;

procedure TIndexView.btnPage1ProgressHalf10Click(Sender: TObject);
begin
  FLoad10.SetValue(50);
end;

procedure TIndexView.btnPage1ProgressFull10Click(Sender: TObject);
begin
  FLoad10.SetValue(100);
end;

procedure TIndexView.btnPage1Stop10Click(Sender: TObject);
begin
  if FLoad10.IsShowing then
    FLoad10.Hide;
end;

procedure TIndexView.btnPage1Load11Click(Sender: TObject);
begin
  FLoad11
    .Parameters
      .Circle
        .Visible_(False)
      .EndCircle
      .Progress
        .ColorBg_(StringToAlphaColor('White'))
        .ColorPg_(StringToAlphaColor('Darkslateblue'))
        .CornerRadius_(5)
        .Size__(10)
        .Visible___(True)
      .EndProgress
      .Text
        .Size_(16)
      .EndText
    .EndParameters
    .Show(lytPage1Load11, 'Loading products');
end;

procedure TIndexView.btnPage1ProgressHalf11Click(Sender: TObject);
begin
  FLoad11.SetValue(50);
end;

procedure TIndexView.btnPage1ProgressFull11Click(Sender: TObject);
begin
  FLoad11.SetValue(100);
end;

procedure TIndexView.btnPage1Stop11Click(Sender: TObject);
begin
  if FLoad11.IsShowing then
    FLoad11.Hide;
end;

procedure TIndexView.btnPage1Load12Click(Sender: TObject);
begin
  FValue := 0;
  FLoad12
    .Parameters
      .Circle
        .Visible_(False)
      .EndCircle
      .Progress
        .ColorBg_(StringToAlphaColor('White'))
        .ColorPg_(StringToAlphaColor('Darkslateblue'))
        .CornerRadius_(4)
        .Size__(10)
        .Visible___(True)
      .EndProgress
      .Text
        .Color__(StringToAlphaColor('Darkslateblue'))
        .Size_(16)
      .EndText
    .EndParameters
    .Show(lytPage1Load12, 'Loading products');
  Timer2.Enabled := True;
end;

procedure TIndexView.Timer2Timer(Sender: TObject);
begin
  if FLoad12.IsShowing then
  begin
    FValue := FValue + 1;
    FLoad12.SetText(FValue.ToString + '%');
    FLoad12.SetValue(FValue);
    if FValue = 100 then
    begin
      FValue := 0;
      FLoad12.Hide;
      Timer2.Enabled := False;
    end;
  end;
end;

procedure TIndexView.btnPage1Stop12Click(Sender: TObject);
begin
  if FLoad12.IsShowing then
    FLoad12.Hide;
end;

end.
