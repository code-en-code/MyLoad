unit myload;

interface

uses
  //delphi
  System.SysUtils,
  System.Classes,
  System.UITypes,
  System.UIConsts,

  //fmx
  FMX.Types,
  FMX.Layouts,
  FMX.Objects,
  FMX.StdCtrls,
  FMX.Graphics,
  FMX.Ani,
  FMX.Forms,
  FMX.Platform,
  FMX.VirtualKeyboard,
  FMX.Controls,
  FMX.Effects;

type
  IMyLoad = interface;
  IMyLoadParameters = interface;
  IMyLoadBackground = interface;
  IMyLoadBox = interface;
  IMyLoadCircle = interface;
  IMyLoadProgress = interface;
  IMyLoadText = interface;

  IMyLoad = interface
    ['{A9B0378E-F157-49F2-901A-157BF5C48F22}']
    function Show(const AContainer: TFmxObject; const AText: String = 'Loading...'): IMyLoad;
    function Hide(const ADestroy: Boolean = False): IMyLoad;
    function SetText(const AText: String): IMyLoad;
    function SetValue(const AValue: Single): IMyLoad;
    function IsShowing: Boolean;
    function OnFinish(AProc: TProc): IMyLoad;
    function Parameters: IMyLoadParameters;
  end;

  IMyLoadParameters = interface
    ['{DB91DA9F-0121-4B58-917D-68746691708F}']
    function Background: IMyLoadBackground;
    function Box: IMyLoadBox;
    function Circle: IMyLoadCircle;
    function Progress: IMyLoadProgress;
    function Text: IMyLoadText;
    function EndParameters: IMyLoad;
  end;

  IMyLoadBackground = interface
    ['{7787F978-98A6-4D9C-B45F-ADA004855C40}']
    function Color(const AColor: TAlphaColor): IMyLoadBackground;
    function EndBackground: IMyLoadParameters;
  end;

  IMyLoadBox = interface
    ['{969F8E38-AE63-44A9-9EDC-78E5790EF8D6}']
    function Color_(const AColor: TAlphaColor): IMyLoadBox;
    function CornerRadius(const AValue: Single): IMyLoadBox;
    function Shadow(const AValue: Boolean = False): IMyLoadBox;
    function Visible(const AVisible: Boolean = False): IMyLoadBox;
    function EndBox: IMyLoadParameters;
  end;

  IMyLoadCircle = interface
    ['{27F3C0DF-2912-45E8-9CFC-915C1D98EF1E}']
    function ActivateBg(const Activate: Boolean = True): IMyLoadCircle;
    function ColorBg(const AColor: TAlphaColor): IMyLoadCircle;
    function ColorArc(const AColor: TAlphaColor): IMyLoadCircle;
    function Shadow_(const AValue: Boolean = False): IMyLoadCircle;
    function Size(const ASize: Single): IMyLoadCircle;
    function Thickness(const AThickness: Single): IMyLoadCircle;
    function Visible_(const AVisible: Boolean = True): IMyLoadCircle;
    function EndCircle: IMyLoadParameters;
  end;

  IMyLoadProgress = interface
    ['{BB085D33-13C3-4A02-9D9E-DDA2160EF43A}']
    function ColorBg_(const AColor: TAlphaColor): IMyLoadProgress;
    function ColorPg_(const AColor: TAlphaColor): IMyLoadProgress;
    function CornerRadius_(const AValue: Single): IMyLoadProgress;
    function Shadow__(const AValue: Boolean = False): IMyLoadProgress;
    function Size__(const ASize: Single): IMyLoadProgress;
    function Visible___(const AVisible: Boolean = True): IMyLoadProgress;
    function EndProgress: IMyLoadParameters;
  end;

  IMyLoadText = interface
    ['{EFC2786A-5AE4-4290-9FCB-A1A9184A57BD}']
    function AnimationEllipsis(const AEllipsis: Boolean = False): IMyLoadText;
    function Color__(const AFontColor: TAlphaColor): IMyLoadText;
    function FontFamily(const AFontFamily: TFontName): IMyLoadText;
    function HorzAlign(const AHorzAlign: TTextAlign): IMyLoadText;
    function Shadow___(const AValue: Boolean = False): IMyLoadText;
    function Size_(const AFontSize: Single): IMyLoadText;
    function Styles(const AFontStyles: TFontStyles): IMyLoadText;
    function VertAlign(const AVertAlign: TTextAlign): IMyLoadText;
    function Visible__(const AVisible: Boolean = True): IMyLoadText;
    function EndText: IMyLoadParameters;
  end;

  TMyLoad = class(TInterfacedObject, IMyLoad,
                          IMyLoadParameters, IMyLoadBackground, IMyLoadBox,
                          IMyLoadCircle, IMyLoadProgress, IMyLoadText)
  private
    { private declarations }
    FGrayIn: TFloatAnimation;
    FGrayOut: TFloatAnimation;
    FBoxIn: TFloatAnimation;
    FBoxOut: TFloatAnimation;
    FArcRotation: TFloatAnimation;
    FProgressIn: TFloatAnimation;
    FTextIn: TFloatAnimation;
    FTextOut: TFloatAnimation;
    FBoxShadowEffect: TShadowEffect;
    FCircleBgShadowEffect: TShadowEffect;
    FCircleArcShadowEffect: TShadowEffect;
    FProgressShadowEffect: TShadowEffect;
    FTextShadowEffect: TShadowEffect;
    FContent: TLayout;
    FGray: TRectangle;
    FBox: TRectangle;
    FBoxContent: TLayout;
    FCircleContent: TLayout;
    FCircleBg: TArc;
    FCircleArc: TArc;
    FProgressContent: TLayout;
    FProgressBg: TRectangle;
    FProgressLine: TRectangle;
    FText: TLabel;
    FTimerEllipsis: TTimer;
    FCountEllipsis: Integer;
    FNewText: String;
    FOnFinish: TProc;
    FBoxShadow: Boolean;
    FCircleShadow: Boolean;
    FProgressShadow: Boolean;
    FTextShadow: Boolean;

    procedure CreateInfra;
    procedure DestroyInfra;
    
    procedure CreateContent;
    procedure CreateGray;
    procedure CreateBox;
    procedure CreateBoxContent;
    procedure CreateCircleContent;
    procedure CreateCircleBg;
    procedure CreateCircleArc;
    procedure CreateProgressContent;
    procedure CreateProgressBg;
    procedure CreateProgressLine;
    procedure CreateText;
    procedure CreateTimerEllipsis;

    procedure GrayIn;
    procedure GrayOut;
    procedure OnFinishGrayOut(Sender: TObject);

    procedure BoxIn;
    procedure BoxOut;
    procedure OnFinishBoxIn(Sender: TObject);
    procedure OnFinishBoxOut(Sender: TObject);

    procedure TextIn;
    procedure TextOut;
    procedure OnFinishTextIn(Sender: TObject);
    procedure OnFinishTextOut(Sender: TObject);

    procedure CircleRotation;

    procedure ProgressIn(const AValue: Single);

    procedure ResetControls;
    procedure BoxResizing;
    procedure ControlsResizing;
    procedure TextResizing;
    procedure RemoveFocus;
    procedure HideKeyboard;
    procedure BringToFront;
    procedure RunAnimationsIn;
    procedure RunAnimationsOut;

    procedure OnTimerEllipsis(Sender: TObject);
  public
    { public declarations }
    constructor Create;
    destructor Destroy; override;
    class function New: IMyLoad;

    function Show(const AContainer: TFmxObject; const AText: String = 'Loading...'): IMyLoad;
    function Hide(const ADestroy: Boolean = False): IMyLoad;
    function SetText(const AText: String): IMyLoad;
    function SetValue(const AValue: Single): IMyLoad;
    function IsShowing: Boolean;
    function OnFinish(AProc: TProc): IMyLoad;
    function Parameters: IMyLoadParameters;

    function Background: IMyLoadBackground;
    function Box: IMyLoadBox;
    function Circle: IMyLoadCircle;
    function Progress: IMyLoadProgress;
    function Text: IMyLoadText;
    function EndParameters: IMyLoad;

    function Color(const AColor: TAlphaColor): IMyLoadBackground;
    function EndBackground: IMyLoadParameters;

    function Color_(const AColor: TAlphaColor): IMyLoadBox;
    function CornerRadius(const AValue: Single): IMyLoadBox;
    function Shadow(const AValue: Boolean = False): IMyLoadBox;
    function Visible(const AVisible: Boolean = False): IMyLoadBox;
    function EndBox: IMyLoadParameters;

    function ActivateBg(const AActivate: Boolean = True): IMyLoadCircle;
    function ColorBg(const AColor: TAlphaColor): IMyLoadCircle;
    function ColorArc(const AColor: TAlphaColor): IMyLoadCircle;
    function Shadow_(const AValue: Boolean = False): IMyLoadCircle;
    function Size(const ASize: Single): IMyLoadCircle;
    function Thickness(const AThickness: Single): IMyLoadCircle;
    function Visible_(const AVisible: Boolean = True): IMyLoadCircle;
    function EndCircle: IMyLoadParameters;

    function ColorBg_(const AColor: TAlphaColor): IMyLoadProgress;
    function ColorPg_(const AColor: TAlphaColor): IMyLoadProgress;
    function CornerRadius_(const AValue: Single): IMyLoadProgress;
    function Shadow__(const AValue: Boolean = False): IMyLoadProgress;
    function Size__(const ASize: Single): IMyLoadProgress;
    function Visible___(const AVisible: Boolean = True): IMyLoadProgress;
    function EndProgress: IMyLoadParameters;

    function AnimationEllipsis(const AEllipsis: Boolean = False): IMyLoadText;
    function Color__(const AFontColor: TAlphaColor): IMyLoadText;
    function FontFamily(const AFontFamily: TFontName): IMyLoadText;
    function HorzAlign(const AHorzAlign: TTextAlign): IMyLoadText;
    function Shadow___(const AValue: Boolean = False): IMyLoadText;
    function Size_(const AFontSize: Single): IMyLoadText;
    function Styles(const AFontStyles: TFontStyles): IMyLoadText;
    function VertAlign(const AVertAlign: TTextAlign): IMyLoadText;
    function Visible__(const AVisible: Boolean = True): IMyLoadText;
    function EndText: IMyLoadParameters;
  end;

implementation

{ TMyLoad }

constructor TMyLoad.Create;
begin
  FContent := nil;
  FGray := nil;
  FBox := nil;
  FBoxContent := nil;
  FCircleContent := nil;
  FCircleArc := nil;
  FProgressContent := nil;
  FProgressBg := nil;
  FProgressLine := nil;
  FText := nil;
  FTimerEllipsis := nil;
  CreateInfra;
end;

destructor TMyLoad.Destroy;
begin
  DestroyInfra;
  inherited;
end;

class function TMyLoad.New: IMyLoad;
begin
  Result := Self.Create;
end;

procedure TMyLoad.CreateInfra;
begin
  CreateContent;
  CreateGray;
  CreateBox;
  CreateBoxContent;
  CreateCircleContent;
  CreateCircleBg;
  CreateCircleArc;
  CreateProgressContent;
  CreateProgressBg;
  CreateProgressLine;
  CreateText;
  CreateTimerEllipsis;
end;

procedure TMyLoad.DestroyInfra;
begin
  if Assigned(FTimerEllipsis) then
    FreeAndNil(FTimerEllipsis);
  if Assigned(FText) then
    FreeAndNil(FText);
  if Assigned(FProgressLine) then
    FreeAndNil(FProgressLine);
  if Assigned(FProgressBg) then
    FreeAndNil(FProgressBg);
  if Assigned(FProgressContent) then
    FreeAndNil(FProgressContent);
  if Assigned(FCircleArc) then
    FreeAndNil(FCircleArc);
  if Assigned(FCircleBg) then
    FreeAndNil(FCircleBg);
  if Assigned(FCircleContent) then
    FreeAndNil(FCircleContent);
  if Assigned(FBoxContent) then
    FreeAndNil(FBoxContent);
  if Assigned(FBox) then
    FreeAndNil(FBox);
  if Assigned(FGray) then
    FreeAndNil(FGray);
  if Assigned(FContent) then
    FreeAndNil(FContent);
end;

procedure TMyLoad.CreateContent;
begin
  TThread.Synchronize(TThread.CurrentThread,
  procedure
  begin
    FContent := TLayout.Create(nil);
    FContent.BeginUpdate;
      FContent.Align := TAlignLayout.Contents;
      FContent.ClipChildren := True;
      FContent.HitTest := False;
      FContent.Opacity := 1;
      FContent.Parent := nil;
      FContent.TabStop := False;
      FContent.Visible := True;
    FContent.EndUpdate;
  end);
end;

procedure TMyLoad.CreateGray;
begin
  TThread.Synchronize(TThread.CurrentThread,
  procedure
  begin
    FGray := TRectangle.Create(FContent);
    FGray.BeginUpdate;
      FGray.Align := TAlignLayout.Contents;
      FGray.ClipChildren := True;
      FGray.Fill.Color := $64708090;
      FGray.Fill.Kind := TBrushKind.Solid;
      FGray.HitTest := True;
      FGray.Opacity := 0;
      FGray.Parent := FContent;
      FGray.Stroke.Kind := TBrushKind.None;
      FGray.TabStop := False;
      FGray.Visible := True;
    FGray.EndUpdate;
  end);
end;

procedure TMyLoad.CreateBox;
begin
  TThread.Synchronize(TThread.CurrentThread,
  procedure
  begin
    FBox := TRectangle.Create(FContent);
    FBox.BeginUpdate;
      FBox.Align := TAlignLayout.Center;
      FBox.ClipChildren := False;
      FBox.CornerType := TCornerType.Round;
      FBox.Fill.Color := $FF708090;
      FBox.Fill.Kind := TBrushKind.None;
      FBox.Height := 0;
      FBox.HitTest := False;
      FBox.Padding.Bottom := 20;
      FBox.Padding.Left := 10;
      FBox.Padding.Right := 10;
      FBox.Padding.Top := 20;
      FBox.Opacity := 0;
      FBox.Parent := FContent;
      FBox.Stroke.Kind := TBrushKind.None;
      FBox.TabStop := False;
      FBox.Visible := True;
      FBox.Width := 0;
      FBox.XRadius := 20;
      FBox.YRadius := 20;

      FBoxShadowEffect := TShadowEffect.Create(FBox);
      FBoxShadowEffect.Direction := 90;
      FBoxShadowEffect.Distance := 1;
      FBoxShadowEffect.Enabled := False;
      FBoxShadowEffect.Parent := FBox;
      FBoxShadowEffect.Opacity := 0.3;
      FBoxShadowEffect.ShadowColor := $FF000000;
      FBoxShadowEffect.Softness := 0.1;
    FBox.EndUpdate;
  end);
end;

procedure TMyLoad.CreateBoxContent;
begin
  TThread.Synchronize(TThread.CurrentThread,
  procedure
  begin
    FBoxContent := TLayout.Create(FBox);
    FBoxContent.BeginUpdate;
      FBoxContent.Align := TAlignLayout.VertCenter;
      FBoxContent.ClipChildren := False;
      FBoxContent.HitTest := False;
      FBoxContent.Opacity := 1;
      FBoxContent.Parent := FBox;
      FBoxContent.TabStop := False;
      FBoxContent.Visible := True;
    FBoxContent.EndUpdate;
  end);
end;

procedure TMyLoad.CreateCircleContent;
begin
  TThread.Synchronize(TThread.CurrentThread,
  procedure
  begin
    FCircleContent := TLayout.Create(FBoxContent);
    FCircleContent.BeginUpdate;
      FCircleContent.Align := TAlignLayout.MostTop;
      FCircleContent.ClipChildren := False;
      FCircleContent.HitTest := False;
      FCircleContent.Opacity := 1;
      FCircleContent.Parent := FBoxContent;
      FCircleContent.TabStop := False;
      FCircleContent.Visible := True;
    FCircleContent.EndUpdate;
  end);
end;

procedure TMyLoad.CreateCircleBg;
begin
  TThread.Synchronize(TThread.CurrentThread,
  procedure
  begin
    FCircleBg := TArc.Create(FCircleContent);
    FCircleBg.BeginUpdate;
      FCircleBg.Align := TAlignLayout.Center;
      FCircleBg.ClipChildren := False;
      FCircleBg.EndAngle := 360;
      FCircleBg.Height := 25;
      FCircleBg.HitTest := False;
      FCircleBg.Opacity := 1;
      FCircleBg.Parent := FCircleContent;
      FCircleBg.Stroke.Color := $FF939393;
      FCircleBg.Stroke.Kind := TBrushKind.Solid;
      FCircleBg.Stroke.Thickness := 2;
      FCircleBg.TabStop := False;
      FCircleBg.Visible := True;
      FCircleBg.Width := 25;

      FCircleBgShadowEffect := TShadowEffect.Create(FCircleBg);
      FCircleBgShadowEffect.Direction := 90;
      FCircleBgShadowEffect.Distance := 1;
      FCircleBgShadowEffect.Enabled := False;
      FCircleBgShadowEffect.Parent := FCircleBg;
      FCircleBgShadowEffect.Opacity := 0.3;
      FCircleBgShadowEffect.ShadowColor := $FF000000;
      FCircleBgShadowEffect.Softness := 0.1;
    FCircleBg.EndUpdate;
  end);
end;

procedure TMyLoad.CreateCircleArc;
begin
  TThread.Synchronize(TThread.CurrentThread,
  procedure
  begin
    FCircleArc := TArc.Create(FCircleContent);
    FCircleArc.BeginUpdate;
      FCircleArc.Align := TAlignLayout.Center;
      FCircleArc.EndAngle := 60;
      FCircleArc.Height := 25;
      FCircleArc.HitTest := False;
      FCircleArc.Opacity := 1;
      FCircleArc.Parent := FCircleContent;
      FCircleArc.Stroke.Color := StringToAlphaColor('White');
      FCircleArc.Stroke.Kind := TBrushKind.Solid;
      FCircleArc.Stroke.Thickness := 2;
      FCircleArc.TabStop := False;
      FCircleArc.Visible := True;
      FCircleArc.Width := 25;

      FCircleArcShadowEffect := TShadowEffect.Create(FCircleArc);
      FCircleArcShadowEffect.Direction := 90;
      FCircleArcShadowEffect.Distance := 1;
      FCircleArcShadowEffect.Enabled := False;
      FCircleArcShadowEffect.Parent := FCircleArc;
      FCircleArcShadowEffect.Opacity := 0.3;
      FCircleArcShadowEffect.ShadowColor := $FF000000;
      FCircleArcShadowEffect.Softness := 0.1;
    FCircleArc.EndUpdate;
    FCircleArc.BringToFront;
  end);
end;

procedure TMyLoad.CreateProgressContent;
begin
  TThread.Synchronize(TThread.CurrentThread,
  procedure
  begin
    FProgressContent := TLayout.Create(FBoxContent);
    FProgressContent.BeginUpdate;
      FProgressContent.Align := TAlignLayout.MostTop;
      FProgressContent.ClipChildren := False;
      FProgressContent.Height := 2;
      FProgressContent.HitTest := False;
      FProgressContent.Margins.Top := 10;
      FProgressContent.Margins.Bottom := 10;
      FProgressContent.Opacity := 1;
      FProgressContent.Parent := FBoxContent;
      FProgressContent.TabStop := False;
      FProgressContent.Visible := False;
    FProgressContent.EndUpdate;
  end);
end;

procedure TMyLoad.CreateProgressBg;
begin
  TThread.Synchronize(TThread.CurrentThread,
  procedure
  begin
    FProgressBg := TRectangle.Create(FProgressContent);
    FProgressBg.BeginUpdate;
      FProgressBg.Align := TAlignLayout.Contents;
      FProgressBg.ClipChildren := False;
      FProgressBg.CornerType := TCornerType.Round;
      FProgressBg.Fill.Color := $FFFFFFFF;
      FProgressBg.Fill.Kind := TBrushKind.Solid;
      FProgressBg.HitTest := False;
      FProgressBg.Opacity := 1;
      FProgressBg.Parent := FProgressContent;
      FProgressBg.Stroke.Kind := TBrushKind.None;
      FProgressBg.TabStop := False;
      FProgressBg.Visible := True;

      FProgressShadowEffect := TShadowEffect.Create(FProgressBg);
      FProgressShadowEffect.Direction := 90;
      FProgressShadowEffect.Distance := 1;
      FProgressShadowEffect.Enabled := False;
      FProgressShadowEffect.Parent := FProgressBg;
      FProgressShadowEffect.Opacity := 0.3;
      FProgressShadowEffect.ShadowColor := $FF000000;
      FProgressShadowEffect.Softness := 0.1;
    FProgressBg.EndUpdate;
  end);
end;

procedure TMyLoad.CreateProgressLine;
begin
  TThread.Synchronize(TThread.CurrentThread,
  procedure
  begin
    FProgressLine := TRectangle.Create(FProgressContent);
    FProgressLine.BeginUpdate;
      FProgressLine.Align := TAlignLayout.Left;
      FProgressLine.ClipChildren := False;
      FProgressLine.CornerType := TCornerType.Round;
      FProgressLine.Fill.Color := $FF939393;
      FProgressLine.Fill.Kind := TBrushKind.Solid;
      FProgressLine.HitTest := False;
      FProgressLine.Opacity := 1;
      FProgressLine.Parent := FProgressContent;
      FProgressLine.Stroke.Kind := TBrushKind.None;
      FProgressLine.TabStop := False;
      FProgressLine.Visible := True;
      FProgressLine.Width := 0;
    FProgressLine.EndUpdate;
    FProgressLine.BringToFront;
  end);
end;

procedure TMyLoad.CreateText;
begin
  TThread.Synchronize(TThread.CurrentThread,
  procedure
  begin
    FText := TLabel.Create(FBoxContent);
    FText.BeginUpdate;
      FText.Align := TAlignLayout.Top;
      FText.AutoSize := True;
      FText.HitTest := False;
      FText.Opacity := 0;
      FText.Parent := FBoxContent;
      FText.StyledSettings := [];
      FText.TabStop := False;
      FText.TextSettings.Font.Family := '';
      FText.TextSettings.Font.Size := 12;
      FText.TextSettings.Font.Style := [TFontStyle.fsBold];
      FText.TextSettings.FontColor := StringToAlphaColor('White');
      FText.TextSettings.HorzAlign := TTextAlign.Center;
      FText.TextSettings.Trimming := TTextTrimming.None;
      FText.TextSettings.VertAlign := TTextAlign.Center;
      FText.TextSettings.WordWrap := False;
      FText.Visible := True;

      FTextShadowEffect := TShadowEffect.Create(FText);
      FTextShadowEffect.Direction := 90;
      FTextShadowEffect.Distance := 1;
      FTextShadowEffect.Enabled := False;
      FTextShadowEffect.Parent := FText;
      FTextShadowEffect.Opacity := 0.3;
      FTextShadowEffect.ShadowColor := $FF000000;
      FTextShadowEffect.Softness := 0.1;
    FText.EndUpdate;
    FText.BringToFront;
  end);
end;

procedure TMyLoad.CreateTimerEllipsis;
begin
  FTimerEllipsis := TTimer.Create(nil);
  FTimerEllipsis.Enabled := False;
  FTimerEllipsis.OnTimer := OnTimerEllipsis;
end;

procedure TMyLoad.GrayIn;
begin
  FGrayIn := TFloatAnimation.Create(FGray);
  FGrayIn.AnimationType := TAnimationType.&In;
  FGrayIn.Delay := 0.1;
  FGrayIn.Duration := 0.2;
  FGrayIn.Interpolation := TInterpolationType.Linear;
  FGrayIn.Parent := FGray;
  FGrayIn.PropertyName := 'Opacity';
  FGrayIn.StartValue := 0;
  FGrayIn.StopValue := 1;
  FGrayIn.Start;
end;

procedure TMyLoad.GrayOut;
begin
  FGrayOut := TFloatAnimation.Create(FGray);
  FGrayOut.AnimationType := TAnimationType.Out;
  FGrayOut.Delay := 0.1;
  FGrayOut.Duration := 0.2;
  FGrayOut.Interpolation := TInterpolationType.Linear;
  FGrayOut.Parent := FGray;
  FGrayOut.PropertyName := 'Opacity';
  FGrayOut.StartValue := 1;
  FGrayOut.StopValue := 0;
  FGrayOut.OnFinish := OnFinishGrayOut;
  FGrayOut.Start;
end;

procedure TMyLoad.OnFinishGrayOut(Sender: TObject);
begin
  FContent.Parent := nil;
  ResetControls;
  if Assigned(FOnFinish) then
    FOnFinish;
end;

procedure TMyLoad.BoxIn;
begin
  FBoxIn := TFloatAnimation.Create(FBox);
  FBoxIn.AnimationType := TAnimationType.&In;
  FBoxIn.Delay := 0.1;
  FBoxIn.Duration := 0.2;
  FBoxIn.Interpolation := TInterpolationType.Linear;
  FBoxIn.Parent := FBox;
  FBoxIn.PropertyName := 'Opacity';
  FBoxIn.StartValue := 0;
  FBoxIn.StopValue := 1;
  FBoxIn.OnFinish := OnFinishBoxIn;
  FBoxIn.Start;
end;

procedure TMyLoad.BoxOut;
begin
  FBoxOut := TFloatAnimation.Create(FBox);
  FBoxOut.AnimationType := TAnimationType.Out;
  FBoxOut.Delay := 0.1;
  FBoxOut.Duration := 0.2;
  FBoxOut.Interpolation := TInterpolationType.Linear;
  FBoxOut.Parent := FBox;
  FBoxOut.PropertyName := 'Opacity';
  FBoxOut.StartValue := 1;
  FBoxOut.StopValue := 0;
  FBoxOut.OnFinish := OnFinishBoxOut;
  FBoxOut.Start;
end;

procedure TMyLoad.OnFinishBoxIn(Sender: TObject);
begin
  TThread.Synchronize(TThread.CurrentThread,
  procedure
  begin
    FBoxShadowEffect.Enabled := FBoxShadow;
    if FCircleShadow then
    begin
      FCircleBgShadowEffect.Enabled := FCircleArc.EndAngle = 60;
      FCircleArcShadowEffect.Enabled := FCircleArc.EndAngle = 280;
    end;
    FProgressShadowEffect.Enabled := FProgressShadow;
  end);
end;

procedure TMyLoad.OnFinishBoxOut(Sender: TObject);
begin
  TThread.Synchronize(TThread.CurrentThread,
  procedure
  begin
    FBoxShadowEffect.Enabled := False;
    FCircleBgShadowEffect.Enabled := False;
    FCircleArcShadowEffect.Enabled := False;
    FProgressShadowEffect.Enabled := False;
  end);
end;

procedure TMyLoad.TextIn;
begin
  FTextIn := TFloatAnimation.Create(FText);
  FTextIn.AnimationType := TAnimationType.&In;
  FTextIn.Delay := 0.1;
  FTextIn.Duration := 0.2;
  FTextIn.Interpolation := TInterpolationType.Linear;
  FTextIn.Parent := FText;
  FTextIn.PropertyName := 'Opacity';
  FTextIn.StartValue := 0;
  FTextIn.StopValue := 1;
  FTextIn.OnFinish := OnFinishTextIn;
  FTextIn.Start;
end;

procedure TMyLoad.TextOut;
begin
  FTextOut := TFloatAnimation.Create(FText);
  FTextOut.AnimationType := TAnimationType.&In;
  FTextOut.Delay := 0.1;
  FTextOut.Duration := 0.2;
  FTextOut.Interpolation := TInterpolationType.Linear;
  FTextOut.Parent := FText;
  FTextOut.PropertyName := 'Opacity';
  FTextOut.StartValue := 1;
  FTextOut.StopValue := 0;
  FTextOut.OnFinish := OnFinishTextOut;
  FTextOut.Start;
end;

procedure TMyLoad.OnFinishTextIn(Sender: TObject);
begin
  TThread.Synchronize(TThread.CurrentThread,
  procedure
  begin
    FTextShadowEffect.Enabled := FTextShadow;
  end);
end;

procedure TMyLoad.OnFinishTextOut(Sender: TObject);
begin
  TThread.Synchronize(TThread.CurrentThread,
  procedure
  begin
    FTextShadowEffect.Enabled := False;
    TextResizing;
  end);
  TextIn;
end;

procedure TMyLoad.CircleRotation;
begin
  FArcRotation := TFloatAnimation.Create(FCircleArc);
  FArcRotation.AnimationType := TAnimationType.InOut;
  FArcRotation.Duration := 0.8;
  FArcRotation.Interpolation := TInterpolationType.Linear;
  FArcRotation.Loop := True;
  FArcRotation.Parent := FCircleArc;
  FArcRotation.PropertyName := 'RotationAngle';
  FArcRotation.StartValue := 0;
  FArcRotation.StopValue := 360;
  FArcRotation.Start;
end;

procedure TMyLoad.ProgressIn(const AValue: Single);
begin
  FProgressIn := TFloatAnimation.Create(FProgressLine);
  FProgressIn.AnimationType := TAnimationType.InOut;
  FProgressIn.Delay := 0.1;
  FProgressIn.Duration := 0.2;
  FProgressIn.Interpolation := TInterpolationType.Linear;
  FProgressIn.Parent := FProgressLine;
  FProgressIn.PropertyName := 'Width';
  FProgressIn.StartValue := FProgressLine.Width;
  FProgressIn.StopValue := AValue;
  FProgressIn.Start;
end;

procedure TMyLoad.ResetControls;
begin
  FNewText := '';
  FText.Text := '';
  FText.Opacity := 0;
  TextResizing;
end;

procedure TMyLoad.BoxResizing;
begin
  TThread.Synchronize(TThread.CurrentThread,
  procedure
  begin
    FBox.BeginUpdate;
      if FContent.Parent.ClassType = TCustomForm then
      begin
        if TCustomForm(FContent.Parent).Width < 480 then
          FBox.Width := FGray.Width - (FGray.Width * 0.1)
        else if TCustomForm(FContent.Parent).Width < 767 then
          FBox.Width := FGray.Width - (FGray.Width * 0.3)
        else if TCustomForm(FContent.Parent).Width < 979 then
          FBox.Width := FGray.Width - (FGray.Width * 0.5)
        else if TCustomForm(FContent.Parent).Width < 1200 then
          FBox.Width := FGray.Width - (FGray.Width * 0.6)
        else
          FBox.Width := FGray.Width - (FGray.Width * 0.7);

        FBox.EndUpdate;
        Exit;
      end;

      if TControl(FContent.Parent).Width < 480 then
        FBox.Width := FGray.Width - (FGray.Width * 0.1)
      else if TControl(FContent.Parent).Width < 767 then
        FBox.Width := FGray.Width - (FGray.Width * 0.3)
      else if TControl(FContent.Parent).Width < 979 then
        FBox.Width := FGray.Width - (FGray.Width * 0.5)
      else if TControl(FContent.Parent).Width < 1200 then
        FBox.Width := FGray.Width - (FGray.Width * 0.6)
      else
        FBox.Width := FGray.Width - (FGray.Width * 0.7);
    FBox.EndUpdate;
  end);
end;

procedure TMyLoad.ControlsResizing;
begin
  TThread.Synchronize(TThread.CurrentThread,
  procedure
  begin
    if (FCircleArc.Visible) and (not FProgressContent.Visible) and (FText.Visible) then
    begin
      FCircleContent.BeginUpdate;
        FCircleContent.Height := FCircleArc.Height;
      FCircleContent.EndUpdate;

      FBoxContent.BeginUpdate;
        FBoxContent.Height := FCircleContent.Height + FText.Height;
      FBoxContent.EndUpdate;

      FBox.BeginUpdate;
        FBox.Height := FBoxContent.Height + FBox.Padding.Top + FBox.Padding.Bottom;
      FBox.EndUpdate;
    end
    else if (FCircleArc.Visible) and (FProgressContent.Visible) and (FText.Visible) then
    begin
      FCircleContent.BeginUpdate;
        FCircleContent.Height := FCircleArc.Height;
      FCircleContent.EndUpdate;

      FBoxContent.BeginUpdate;
        FBoxContent.Height := FCircleContent.Height + FProgressContent.Height + FProgressContent.Margins.Top + FProgressContent.Margins.Bottom + FText.Height;
      FBoxContent.EndUpdate;

      FBox.BeginUpdate;
        FBox.Height := FBoxContent.Height + FBox.Padding.Top + FBox.Padding.Bottom;
      FBox.EndUpdate;
    end
    else if (FCircleArc.Visible) and (not FProgressContent.Visible) and (not FText.Visible) then
    begin
      FCircleContent.BeginUpdate;
        FCircleContent.Height := FCircleArc.Height;
      FCircleContent.EndUpdate;

      FBoxContent.BeginUpdate;
        FBoxContent.Height := FCircleContent.Height;
      FBoxContent.EndUpdate;

      FBox.BeginUpdate;
        FBox.Height := FBoxContent.Height + FBox.Padding.Top + FBox.Padding.Bottom;
      FBox.EndUpdate;
    end
    else if (FCircleArc.Visible) and (FProgressContent.Visible) and (not FText.Visible) then
    begin
      FCircleContent.BeginUpdate;
        FCircleContent.Height := FCircleArc.Height;
      FCircleContent.EndUpdate;

      FBoxContent.BeginUpdate;
        FBoxContent.Height := FCircleContent.Height + FProgressContent.Height + FProgressContent.Margins.Top + FProgressContent.Margins.Bottom;
      FBoxContent.EndUpdate;

      FBox.BeginUpdate;
        FBox.Height := FBoxContent.Height + FBox.Padding.Top + FBox.Padding.Bottom;
      FBox.EndUpdate;
    end
    else if (not FCircleArc.Visible) and (not FProgressContent.Visible) and (FText.Visible) then
    begin
      FCircleContent.BeginUpdate;
        FCircleContent.Height := 0;
      FCircleContent.EndUpdate;

      FBoxContent.BeginUpdate;
        FBoxContent.Height := FCircleContent.Height + FText.Height;
      FBoxContent.EndUpdate;

      FBox.BeginUpdate;
        FBox.Height := FBoxContent.Height + FBox.Padding.Top + FBox.Padding.Bottom;
      FBox.EndUpdate;
    end
    else if (not FCircleArc.Visible) and (FProgressContent.Visible) and (FText.Visible) then
    begin
      FCircleContent.BeginUpdate;
        FCircleContent.Height := 0;
      FCircleContent.EndUpdate;

      FBoxContent.BeginUpdate;
        FBoxContent.Height := FCircleContent.Height + FProgressContent.Height + FProgressContent.Margins.Top + FProgressContent.Margins.Bottom + FText.Height;
      FBoxContent.EndUpdate;

      FBox.BeginUpdate;
        FBox.Height := FBoxContent.Height + FBox.Padding.Top + FBox.Padding.Bottom;
      FBox.EndUpdate;
    end;
  end);
end;

procedure TMyLoad.TextResizing;
begin
  FText.BeginUpdate;
    FText.Text := FNewText;
    FText.WordWrap := False;
    FText.AutoSize := True;
    FText.WordWrap := True;
  FText.EndUpdate;
  FText.RecalcSize;
end;

procedure TMyLoad.RemoveFocus;
begin
  if Assigned(Application.MainForm) then
    Application.MainForm.Focused := nil;
end;

procedure TMyLoad.HideKeyboard;
var
  LKeyboard: IFMXVirtualKeyboardService;
begin
  if TPlatformServices.Current.SupportsPlatformService(IFMXVirtualKeyboardService, LKeyboard) then
  begin
    if TVirtualKeyBoardState.Visible in LKeyboard.GetVirtualKeyBoardState then
      LKeyboard.HideVirtualKeyboard;
  end;
  LKeyboard := nil;
end;

procedure TMyLoad.BringToFront;
begin
  FContent.BringToFront;
end;

procedure TMyLoad.RunAnimationsIn;
begin
  GrayIn;
  BoxIn;
  CircleRotation;
end;

procedure TMyLoad.RunAnimationsOut;
begin
  BoxOut;
  GrayOut;
end;

procedure TMyLoad.OnTimerEllipsis(Sender: TObject);
begin
  FText.BeginUpdate;
    FCountEllipsis := FCountEllipsis + 1;
    if FCountEllipsis = 1 then
      FText.Text := FNewText + '.'
    else if FCountEllipsis = 2 then
      FText.Text := FNewText + '..'
    else if FCountEllipsis = 3 then
      FText.Text := FNewText + '...'
    else
    begin
      FText.Text := FNewText;
      FCountEllipsis := 0;
    end;
  FText.EndUpdate;
end;

function TMyLoad.Show(const AContainer: TFmxObject; const AText: String = 'Loading...'): IMyLoad;
begin
  Result := Self;
  if not Assigned(FContent) then
    CreateInfra;
  FContent.Parent := AContainer;
  ResetControls;
  BoxResizing;
  SetText(AText);
  ControlsResizing;
  RemoveFocus;
  HideKeyboard;
  BringToFront;
  RunAnimationsIn;
end;

function TMyLoad.Hide(const ADestroy: Boolean = False): IMyLoad;
begin
  Result := Self;
  if ADestroy then
  begin
    DestroyInfra;
    Exit;
  end;
  RunAnimationsOut;
end;

function TMyLoad.SetText(const AText: String): IMyLoad;
begin
  Result := Self;
  if not Assigned(FContent) then
    Exit;

  FNewText := AText;
  TThread.Synchronize(TThread.CurrentThread,
  procedure
  begin
    if FText.Opacity = 1 then
    begin
      TextOut;
      Exit;
    end;

    TextResizing;
    TextIn;
  end);
end;

function TMyLoad.SetValue(const AValue: Single): IMyLoad;
begin
  Result := Self;
  if not FProgressContent.Visible then
    Exit;

  TThread.Synchronize(TThread.CurrentThread,
  procedure
  begin
    if (AValue >= 0) and (AValue <= 100) then
      ProgressIn(FProgressContent.Width * (AValue / 100));
  end);
end;

function TMyLoad.IsShowing: Boolean;
begin
  Result := FGray.Opacity = 1;
end;

function TMyLoad.OnFinish(AProc: TProc): IMyLoad;
begin
  Result := Self;
  FOnFinish := AProc;
end;

function TMyLoad.Parameters: IMyLoadParameters;
begin
  Result := Self;
end;

function TMyLoad.EndParameters: IMyLoad;
begin
  Result := Self;
end;

function TMyLoad.Background: IMyLoadBackground;
begin
  Result := Self;
end;

function TMyLoad.Color(const AColor: TAlphaColor): IMyLoadBackground;
begin
  Result := Self;
  TThread.Synchronize(TThread.CurrentThread,
  procedure
  begin
    FGray.BeginUpdate;
      FGray.Fill.Color := AColor;
    FGray.EndUpdate;
  end);
end;

function TMyLoad.EndBackground: IMyLoadParameters;
begin
  Result := Self;
end;

function TMyLoad.Box: IMyLoadBox;
begin
  Result := Self;
end;

function TMyLoad.Color_(const AColor: TAlphaColor): IMyLoadBox;
begin
  Result := Self;
  TThread.Synchronize(TThread.CurrentThread,
  procedure
  begin
    FBox.BeginUpdate;
      FBox.Fill.Color := AColor;
    FBox.EndUpdate;
  end);
end;

function TMyLoad.CornerRadius(const AValue: Single): IMyLoadBox;
begin
  Result := Self;
  TThread.Synchronize(TThread.CurrentThread,
  procedure
  begin
    FBox.BeginUpdate;
      FBox.XRadius := AValue;
      FBox.YRadius := AValue;
    FBox.EndUpdate;
  end);
end;

function TMyLoad.Shadow(const AValue: Boolean = False): IMyLoadBox;
begin
  Result := Self;
  FBoxShadow := AValue;
end;

function TMyLoad.Visible(const AVisible: Boolean): IMyLoadBox;
begin
  Result := Self;
  TThread.Synchronize(TThread.CurrentThread,
  procedure
  begin
    FBox.BeginUpdate;
      if not AVisible then
      begin
        FBox.ClipChildren := False;
        FBox.Fill.Kind := TBrushKind.None;
        FBox.Fill.Color := $FF708090;
        FBox.EndUpdate;
        Exit;
      end;

      FBox.ClipChildren := True;
      FBox.Fill.Kind := TBrushKind.Solid;
    FBox.EndUpdate;
  end);
end;

function TMyLoad.EndBox: IMyLoadParameters;
begin
  Result := Self;
end;

function TMyLoad.Circle: IMyLoadCircle;
begin
  Result := Self;
end;

function TMyLoad.ActivateBg(const AActivate: Boolean = True): IMyLoadCircle;
begin
  Result := Self;
  TThread.Synchronize(TThread.CurrentThread,
  procedure
  begin
    FCircleBg.BeginUpdate;
      FCircleBg.Visible := AActivate;
    FCircleBg.EndUpdate;

    if AActivate then
    begin
      FCircleArc.BeginUpdate;
        FCircleArc.EndAngle := 60;
      FCircleArc.EndUpdate;
    end
    else
    begin
      FCircleArc.BeginUpdate;
        FCircleArc.EndAngle := 280;
      FCircleArc.EndUpdate;
    end;
  end);
end;

function TMyLoad.ColorBg(const AColor: TAlphaColor): IMyLoadCircle;
begin
  Result := Self;
  TThread.Synchronize(TThread.CurrentThread,
  procedure
  begin
    FCircleBg.BeginUpdate;
      FCircleBg.Stroke.Color := AColor;
    FCircleBg.EndUpdate;
  end);
end;

function TMyLoad.ColorArc(const AColor: TAlphaColor): IMyLoadCircle;
begin
  Result := Self;
  TThread.Synchronize(TThread.CurrentThread,
  procedure
  begin
    FCircleArc.BeginUpdate;
      FCircleArc.Stroke.Color := AColor;
    FCircleArc.EndUpdate;
  end);
end;

function TMyLoad.Shadow_(const AValue: Boolean = False): IMyLoadCircle;
begin
  Result := Self;
  FCircleShadow := AValue;
end;

function TMyLoad.Size(const ASize: Single): IMyLoadCircle;
begin
  Result := Self;
  TThread.Synchronize(TThread.CurrentThread,
  procedure
  begin
    FCircleBg.BeginUpdate;
      FCircleBg.Height := ASize;
      FCircleBg.Width := ASize;
    FCircleBg.EndUpdate;
    FCircleArc.BeginUpdate;
      FCircleArc.Height := ASize;
      FCircleArc.Width := ASize;
    FCircleArc.EndUpdate;
  end);
end;

function TMyLoad.Thickness(const AThickness: Single): IMyLoadCircle;
begin
  Result := Self;
  TThread.Synchronize(TThread.CurrentThread,
  procedure
  begin
    FCircleBg.BeginUpdate;
      FCircleBg.Stroke.Thickness := AThickness;
    FCircleBg.EndUpdate;
    FCircleArc.BeginUpdate;
      FCircleArc.Stroke.Thickness := AThickness;
    FCircleArc.EndUpdate;
  end);
end;

function TMyLoad.Visible_(const AVisible: Boolean): IMyLoadCircle;
begin
  Result := Self;
  TThread.Synchronize(TThread.CurrentThread,
  procedure
  begin
    FCircleArc.BeginUpdate;
      FCircleArc.Visible := AVisible;
    FCircleArc.EndUpdate;
  end);
end;

function TMyLoad.EndCircle: IMyLoadParameters;
begin
  Result := Self;
end;

function TMyLoad.Progress: IMyLoadProgress;
begin
  Result := Self;
end;

function TMyLoad.ColorBg_(const AColor: TAlphaColor): IMyLoadProgress;
begin
  Result := Self;
  TThread.Synchronize(TThread.CurrentThread,
  procedure
  begin
    FProgressBg.BeginUpdate;
      FProgressBg.Fill.Color := AColor;
    FProgressBg.EndUpdate;
  end);
end;

function TMyLoad.ColorPg_(const AColor: TAlphaColor): IMyLoadProgress;
begin
  Result := Self;
  TThread.Synchronize(TThread.CurrentThread,
  procedure
  begin
    FProgressLine.BeginUpdate;
      FProgressLine.Fill.Color := AColor;
    FProgressLine.EndUpdate;
  end);
end;

function TMyLoad.CornerRadius_(const AValue: Single): IMyLoadProgress;
begin
  Result := Self;
  TThread.Synchronize(TThread.CurrentThread,
  procedure
  begin
    FProgressBg.BeginUpdate;
      FProgressBg.XRadius := AValue;
      FProgressBg.YRadius := AValue;
    FProgressBg.EndUpdate;
    FProgressLine.BeginUpdate;
      FProgressLine.XRadius := AValue;
      FProgressLine.YRadius := AValue;
    FProgressLine.EndUpdate;
  end);
end;

function TMyLoad.Shadow__(const AValue: Boolean = False): IMyLoadProgress;
begin
  Result := Self;
  FProgressShadow := AValue;
end;

function TMyLoad.Size__(const ASize: Single): IMyLoadProgress;
begin
  Result := Self;
  TThread.Synchronize(TThread.CurrentThread,
  procedure
  begin
    FProgressContent.BeginUpdate;
      FProgressContent.Height := ASize;
    FProgressContent.EndUpdate;
  end);
end;

function TMyLoad.Visible___(const AVisible: Boolean): IMyLoadProgress;
begin
  Result := Self;
  TThread.Synchronize(TThread.CurrentThread,
  procedure
  begin
    FProgressContent.BeginUpdate;
      FProgressLine.Width := 0;
      FProgressContent.Visible := AVisible;
    FProgressContent.EndUpdate;
  end);
end;

function TMyLoad.EndProgress: IMyLoadParameters;
begin
  Result := Self;
end;

function TMyLoad.Text: IMyLoadText;
begin
  Result := Self;
end;

function TMyLoad.AnimationEllipsis(const AEllipsis: Boolean = False): IMyLoadText;
begin
  Result := Self;
  if FText.Visible and AEllipsis then
  begin
    FTimerEllipsis.Enabled := True;
    FCountEllipsis := 1;
  end
  else
    FTimerEllipsis.Enabled := False;
end;

function TMyLoad.FontFamily(const AFontFamily: TFontName): IMyLoadText;
begin
  Result := Self;
  TThread.Synchronize(TThread.CurrentThread,
  procedure
  begin
    FText.BeginUpdate;
      FText.TextSettings.Font.Family := AFontFamily;
    FText.EndUpdate;
  end);
end;

function TMyLoad.Size_(const AFontSize: Single): IMyLoadText;
begin
  Result := Self;
  TThread.Synchronize(TThread.CurrentThread,
  procedure
  begin
    FText.BeginUpdate;
      FText.TextSettings.Font.Size := AFontSize;
    FText.EndUpdate;
  end);
end;

function TMyLoad.Color__(const AFontColor: TAlphaColor): IMyLoadText;
begin
  Result := Self;
  TThread.Synchronize(TThread.CurrentThread,
  procedure
  begin
    FText.BeginUpdate;
      FText.TextSettings.FontColor := AFontColor;
    FText.EndUpdate;
  end);
end;

function TMyLoad.Styles(const AFontStyles: TFontStyles): IMyLoadText;
begin
  Result := Self;
  TThread.Synchronize(TThread.CurrentThread,
  procedure
  begin
    FText.BeginUpdate;
      FText.TextSettings.Font.Style := AFontStyles;
    FText.EndUpdate;
  end);
end;

function TMyLoad.HorzAlign(const AHorzAlign: TTextAlign): IMyLoadText;
begin
  Result := Self;
  TThread.Synchronize(TThread.CurrentThread,
  procedure
  begin
    FText.BeginUpdate;
      FText.TextSettings.HorzAlign := AHorzAlign;
    FText.EndUpdate;
  end);
end;

function TMyLoad.Shadow___(const AValue: Boolean = False): IMyLoadText;
begin
  Result := Self;
  FTextShadow := AValue;
end;

function TMyLoad.VertAlign(const AVertAlign: TTextAlign): IMyLoadText;
begin
  Result := Self;
  TThread.Synchronize(TThread.CurrentThread,
  procedure
  begin
    FText.BeginUpdate;
      FText.TextSettings.VertAlign := AVertAlign;
    FText.EndUpdate;
  end);
end;

function TMyLoad.Visible__(const AVisible: Boolean = True): IMyLoadText;
begin
  Result := Self;
  TThread.Synchronize(TThread.CurrentThread,
  procedure
  begin
    FText.BeginUpdate;
      FText.Visible := AVisible;
    FText.EndUpdate;
  end);
end;

function TMyLoad.EndText: IMyLoadParameters;
begin
  Result := Self;
end;

end.
