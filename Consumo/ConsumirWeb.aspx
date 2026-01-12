<%@ Page Language="VB" AutoEventWireup="true" CodeFile="ConsumirWeb.aspx.vb" Inherits="ConsumirWeb" %>

<!DOCTYPE html>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Cotizador</title>
    <style>
    label {
      font-weight: bold;
      margin-bottom: 2px;
    }
    .campo-obligatorio-error {
      border: 2px solid #dc3545 !important;
      background-color: #fff0f0 !important;
    }
    .campo-lip {
      display: none;
    }
    .campo-moneda {
      text-align: right;
      font-family: 'Courier New', monospace;
    }
    .campo-moneda::before {
      content: "Q ";
      color: #666;
      font-weight: normal;
    }
    </style>
</head>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="row" style="border: 3px double #0056b3; padding: 20px; margin: 25px 0 0 0;" id="resultadosContainer">
                <div class="col-12 col-md-4 mb-3">
                    <label>RCI:</label>
                    <asp:TextBox ID="rci" runat="server" disabled="true" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="col-12 col-md-4 mb-3">
                    <label>RDG:</label>
                    <asp:TextBox ID="rdg" runat="server" disabled="true" CssClass="form-control"></asp:TextBox>
                </div>

                <div class="col-12 col-md-4 mb-3">
                    <label>Valor de cuota</label>
                    <asp:TextBox ID="noCuota" runat="server" disabled="true" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="col-12 col-md-4 mb-3 campo-lip">
                    <label>Cuota 1-48 (Total)</label>
                    <asp:TextBox ID="cuota1al48Total" runat="server" disabled="true" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="col-12 col-md-4 mb-3 campo-lip">
                    <label>Cuota 1-48 (Cliente)</label>
                    <asp:TextBox ID="cuota1al48Cliente" runat="server" disabled="true" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="col-12 col-md-4 mb-3 campo-lip">
                    <label>RCI 1-48 (Total)</label>
                    <asp:TextBox ID="rci1al48Total" runat="server" disabled="true" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="col-12 col-md-4 mb-3 campo-lip">
                    <label>RCI 1-48 (Cliente)</label>
                    <asp:TextBox ID="rci1al48" runat="server" disabled="true" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="col-12 mb-3 campo-lip">
                    <hr style="border-top: 2px solid #0056b3; margin: 20px 0;">
                </div>
                <div class="col-12 col-md-4 mb-3 campo-lip">
                    <label>Cuota 49-84 (Total)</label>
                    <asp:TextBox ID="cuota49al84Total" runat="server" disabled="true" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="col-12 col-md-4 mb-3 campo-lip">
                    <label>Cuota 49-84 (Cliente)</label>
                    <asp:TextBox ID="cuota49al84Cliente" runat="server" disabled="true" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="col-12 col-md-4 mb-3 campo-lip">
                    <label>RCI 49-84 (Total)</label>
                    <asp:TextBox ID="rci49al84Total" runat="server" disabled="true" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="col-12 col-md-4 mb-3 campo-lip">
                    <label>RCI 49-84 (Cliente)</label>
                    <asp:TextBox ID="rci49al84" runat="server" disabled="true" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="col-12 mb-3 campo-lip">
                    <hr style="border-top: 2px solid #0056b3; margin: 20px 0;">
                </div>
                <div class="col-12 col-md-4 mb-3 campo-lip">
                    <label>Cuota 85+ (Total)</label>
                    <asp:TextBox ID="cuota85masTotal" runat="server" disabled="true" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="col-12 col-md-4 mb-3 campo-lip">
                    <label>Cuota 85+ (Cliente)</label>
                    <asp:TextBox ID="cuota85masCliente" runat="server" disabled="true" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="col-12 col-md-4 mb-3 campo-lip">
                    <label>RCI 85+ (Total)</label>
                    <asp:TextBox ID="rci85masTotal" runat="server" disabled="true" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="col-12 col-md-4 mb-3 campo-lip">
                    <label>RCI 85+ (Cliente)</label>
                    <asp:TextBox ID="rci85mas" runat="server" disabled="true" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="col-12 mt-3">
                    <asp:Label ID="detalle" runat="server" disabled="true" CssClass="form-control"></asp:Label>
                </div>
            </div>
            <div class="accordion mt-3" id="accordionDesgloseCuotas">
                <div class="accordion-item" id="desgloseCuotasContainer">
                  <h2 class="accordion-header" id="headingDesglose">
                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseDesglose" aria-expanded="false" aria-controls="collapseDesglose">
                      Desglose de cuotas
                    </button>
                  </h2>
                  <div id="collapseDesglose" class="accordion-collapse collapse" aria-labelledby="headingDesglose" data-bs-parent="#accordionDesgloseCuotas">
                    <div class="accordion-body">
                      <table class="table table-bordered">
                        <tbody>
                          <tr>
                            <td>Capital</td>
                            <td><asp:Label ID="lblCapital" runat="server" /></td>
                          </tr>
                          <tr>
                            <td>Intereses</td>
                            <td><asp:Label ID="lblIntereses" runat="server" /></td>
                          </tr>
                          <tr>
                            <td>Cuota sin seguros</td>
                            <td><asp:Label ID="lblCuotaSinSeguros" runat="server" /></td>
                          </tr>
                          <tr>
                            <td>Seguro de vida</td>
                            <td><asp:Label ID="lblSeguroVida" runat="server" /></td>
                          </tr>
                          <tr>
                            <td>Seguro de daños</td>
                            <td><asp:Label ID="lblSeguroDanios" runat="server" /></td>
                          </tr>
                          <tr>
                            <td>Cuota total</td>
                            <td><asp:Label ID="lblCuotaTotal" runat="server" /></td>
                          </tr>
                          <tr>
                            <td>Endeudamiento Interno</td>
                            <td><asp:Label ID="lblEndeudamientoInterno" runat="server" /></td>
                          </tr>
                          <tr>
                            <td>Endeudamiento Externo</td>
                            <td><asp:Label ID="lblEndeudamientoExterno" runat="server" /></td>
                          </tr>
                          <tr>
                            <td>Cuotas vigentes</td>
                            <td><asp:Label ID="lblCuotasVigentes" runat="server" /></td>
                          </tr>
                        </tbody>
                      </table>
                    </div>
                  </div>
                </div>
              </div>
            <hr />
            <div class="row">
                <div class="col-12 col-sm-6 col-md-4 col-lg-3 mb-3">
                    <label class="">Destino Crédito</label>
                    <asp:DropDownList CssClass="form-control cotizador" runat="server" ID="destinoCredito">
                        <asp:ListItem>Compra de Vivienda</asp:ListItem>
                        <asp:ListItem>Consolidación de deudas</asp:ListItem>
                        <asp:ListItem>Mixto</asp:ListItem>
                        <asp:ListItem>FHA</asp:ListItem>
                        <asp:ListItem>Compra de terreno</asp:ListItem>
                        <asp:ListItem>Construcción</asp:ListItem>
                        <asp:ListItem>Remodelación</asp:ListItem>
                        <asp:ListItem>LIP FHA</asp:ListItem>
                        <asp:ListItem>LIP DIRECTO</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="col-12 col-sm-6 col-md-4 col-lg-3 mb-3">
                    <label class="">Monto Solicitado</label>
                    <asp:TextBox CssClass="form-control cotizador solo-numeros" ID="montoSolicitado" runat="server"></asp:TextBox>
                </div>
                <div class="col-12 col-sm-6 col-md-4 col-lg-3 mb-3">
                    <label class="">Antigüedad de Garantía</label>
                    <asp:DropDownList CssClass="form-control cotizador" runat="server" ID="tipoGarantia">
                        <asp:ListItem>Nueva</asp:ListItem>
                        <asp:ListItem>Usada</asp:ListItem>
                        <asp:ListItem>Terreno</asp:ListItem>
                        <asp:ListItem>LIP FHA</asp:ListItem>
                        <asp:ListItem>LIP DIRECTO</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="col-12 col-sm-6 col-md-4 col-lg-3 mb-3">
                    <label class="">Tasa Interés %</label>
                    <asp:TextBox CssClass="form-control cotizador solo-numeros" ID="tasaInteres" runat="server" TextMode="Number" min="0" step="0.01"></asp:TextBox>
                </div>
                <div class="col-12 col-sm-6 col-md-4 col-lg-3 mb-3">
                    <label class="">Plazo</label>
                    <asp:TextBox CssClass="form-control cotizador solo-numeros" TextMode="Number" ID="plazoMeses" runat="server" min="1"></asp:TextBox>
                    <asp:Label ID="lblPlazoAdvertencia" runat="server" CssClass="text-danger" Style="font-size: 12px;"></asp:Label>
                </div>
                <div class="col-12 col-sm-6 col-md-4 col-lg-3 mb-3">
                    <label class="">Tipo de Cuota</label>
                    <asp:DropDownList CssClass="form-control cotizador" runat="server" ID="tipoCuota">
                        <asp:ListItem Value="nivelada">Cuota Nivelada</asp:ListItem>
                        <asp:ListItem Value="saldos">Cuota sobre saldos</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="col-12 col-sm-6 col-md-4 col-lg-3 mb-3">
                    <label class="">Tasa Referencia LIP %</label>
                    <asp:TextBox CssClass="form-control cotizador solo-numeros" ID="tasaReferenciaLIP" runat="server" TextMode="Number" min="0" step="0.01" disabled="true" placeholder="Solo para LIP FHA y LIP DIRECTO"></asp:TextBox>
                </div>
            </div>
            <div class="row mb-2">
                <div class="col-12">
                    <button style="margin-top:10px" Class="btn btn-primary" runat="server" id="btnArchivos" OnClick="cargarListaArchivos(); return false;">Editar tasas</button>
                </div>
            </div>
            <hr />
            <div class="row">
                <h3>Ingresos</h3>
                <div class="col-12 col-sm-6 col-md-4 col-lg-3 mb-3">
                    <label class="">Actividad Económica</label>
                    <asp:DropDownList CssClass="form-control cotizador" runat="server" ID="actividad">
                        <asp:ListItem>Relacion de dependencia</asp:ListItem>
                        <asp:ListItem>Negocio propio</asp:ListItem>
                        <asp:ListItem>Servicios profesionales</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="col-12 col-sm-6 col-md-4 col-lg-3 mb-3">
                    <label class="">Ingreso Constancia</label>
                    <asp:TextBox CssClass="form-control cotizador solo-numeros" runat="server" ID="ingresoConstancia"></asp:TextBox>
                </div>
                <div class="col-12 col-sm-6 col-md-4 col-lg-3 mb-3">
                    <label class="">Bonificación</label>
                    <asp:TextBox CssClass="form-control cotizador solo-numeros" runat="server" ID="bonificacionActividadEconomica"></asp:TextBox>
                </div>
                <div class="col-12 col-sm-6 col-md-4 col-lg-3 mb-3">
                    <label class="">IGGS</label>
                    <asp:TextBox CssClass="form-control cotizador solo-numeros" runat="server" ID="iggsActividadEconomica" min="0"></asp:TextBox>
                </div>
                <div class="col-12 col-sm-6 col-md-4 col-lg-3 mb-3">
                    <label class="">ISR</label>
                    <asp:TextBox CssClass="form-control cotizador solo-numeros" runat="server" ID="isrActividadEconomica" min="0"></asp:TextBox>
                </div>
                <div class="col-12 col-sm-6 col-md-4 col-lg-3 mb-3">
                    <label class="">Comisiones</label>
                    <asp:TextBox CssClass="form-control cotizador solo-numeros" runat="server" ID="comisionesActividadEconomica"></asp:TextBox>
                </div>
            </div>
            <div class="row">
                <div class="col-12 col-sm-6 col-md-4 col-lg-3 mb-3">
                    <label class="">Actividad Económica 2</label>
                    <asp:DropDownList CssClass="form-control cotizador" runat="server" ID="actividad2">
                        <asp:ListItem></asp:ListItem>    
                        <asp:ListItem>Relacion de dependencia</asp:ListItem>
                        <asp:ListItem>Negocio propio</asp:ListItem>
                        <asp:ListItem>Servicios profesionales</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="col-12 col-sm-6 col-md-4 col-lg-3 mb-3">
                    <label class="">Ingreso Constancia</label>
                    <asp:TextBox CssClass="form-control cotizador solo-numeros" runat="server" ID="ingresoConstancia2"></asp:TextBox>
                </div>
                <div class="col-12 col-sm-6 col-md-4 col-lg-3 mb-3">
                    <label class="">Bonificación</label>
                    <asp:TextBox CssClass="form-control cotizador solo-numeros" runat="server" ID="bonificacionActividadEconomica2"></asp:TextBox>
                </div>
                <div class="col-12 col-sm-6 col-md-4 col-lg-3 mb-3">
                    <label class="">IGGS</label>
                    <asp:TextBox CssClass="form-control cotizador solo-numeros" runat="server" ID="iggsActividadEconomica2"></asp:TextBox>
                </div>
                <div class="col-12 col-sm-6 col-md-4 col-lg-3 mb-3">
                    <label class="">ISR</label>
                    <asp:TextBox CssClass="form-control cotizador solo-numeros" runat="server" ID="isrActividadEconomica2"></asp:TextBox>
                </div>
                <div class="col-12 col-sm-6 col-md-4 col-lg-3 mb-3">
                    <label class="">Comisiones</label>
                    <asp:TextBox CssClass="form-control cotizador solo-numeros" runat="server" ID="comisionesActividadEconomica2"></asp:TextBox>
                </div>
            </div>
            <hr />
            <div class="row">
                <h3>Descuentos</h3>
                <div class="col-12 col-sm-6 col-md-4 col-lg-3 mb-3">
                    <label class="">Descuento Constancia</label>
                    <asp:TextBox CssClass="form-control cotizador solo-numeros" runat="server" ID="descuentoConstancia"></asp:TextBox>
                </div>
                <div class="col-12 col-sm-6 col-md-4 col-lg-3 mb-3">
                    <label class="">Auxilio Póstumo</label>
                    <asp:TextBox CssClass="form-control cotizador solo-numeros" runat="server" ID="auxilioPostumo"></asp:TextBox>
                </div>
                <div class="col-12 col-sm-6 col-md-4 col-lg-3 mb-3">
                    <label class="">Montepio</label>
                    <asp:TextBox CssClass="form-control cotizador solo-numeros" runat="server" ID="montepio"></asp:TextBox>
                </div>
                <div class="col-12 col-sm-6 col-md-4 col-lg-3 mb-3">
                    <label class="">Seguro</label>
                    <asp:TextBox CssClass="form-control cotizador solo-numeros" runat="server" ID="seguro"></asp:TextBox>
                </div>
            </div>
            
            <hr />
            <div class="row">
                <h3>Deudas</h3>
                <div class="row">
                    <div class="col-12 col-sm-6 col-md-4 col-lg-3 mb-3">
                        <label class="">Tipo Deuda 1</label>
                        <asp:DropDownList runat="server" CssClass="form-control cotizador" ID="tipoDeuda1">
                            <asp:ListItem></asp:ListItem>
                            <asp:ListItem>Tarjeta de Credito Interna</asp:ListItem>
                            <asp:ListItem>Tarjeta de Credito Mayor a 9 m</asp:ListItem>
                            <asp:ListItem>Tarjeta de Credito Menor a 9m</asp:ListItem>
                            <asp:ListItem>Prestamo Hipotecario</asp:ListItem>
                            <asp:ListItem>Prestamo Fiduciario</asp:ListItem>
                            <asp:ListItem>Prestamo Fiduciario Indirecto Bantrab</asp:ListItem>
                            <asp:ListItem>Factorje Fiduciario</asp:ListItem>
                            <asp:ListItem>Prestamo Bienes Inmuebles</asp:ListItem>
                            <asp:ListItem>Prestamo Bienes Inmuebles - Prendas</asp:ListItem>
                            <asp:ListItem>Prestamo Fiduciario - Prendas</asp:ListItem>
                            <asp:ListItem>Fiduciaria Otras Garantias</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="col-12 col-sm-6 col-md-4 col-lg-3 mb-3">
                        <label class="">Saldo de Deuda 1</label>
                        <asp:TextBox CssClass="form-control cotizador solo-numeros" runat="server" ID="saldoDeuda1"></asp:TextBox>
                    </div>
                    <div class="col-12 col-sm-6 col-md-4 col-lg-3 mb-3">
                        <label class="">Límite Tarjeta 1</label>
                        <asp:TextBox CssClass="form-control cotizador solo-numeros" runat="server" ID="limiteTarjeta1"></asp:TextBox>
                    </div>
                    <div class="col-12 col-sm-6 col-md-4 col-lg-3 mb-3">
                        <label class="">Cuota Deuda 1</label>
                        <asp:TextBox CssClass="form-control cotizador solo-numeros" runat="server" ID="cuotaDeuda1"></asp:TextBox>
                    </div>
                </div>
                <div class="row">
                    <div class="col-12 col-sm-6 col-md-4 col-lg-3 mb-3">
                        <label class="">Tipo Deuda 2</label>
                        <asp:DropDownList runat="server" CssClass="form-control cotizador" ID="tipoDeuda2">
                            <asp:ListItem></asp:ListItem>
                            <asp:ListItem>Tarjeta de Credito Interna</asp:ListItem>
                            <asp:ListItem>Tarjeta de Credito Mayor a 9 m</asp:ListItem>
                            <asp:ListItem>Tarjeta de Credito Menor a 9m</asp:ListItem>
                            <asp:ListItem>Prestamo Hipotecario</asp:ListItem>
                            <asp:ListItem>Prestamo Fiduciario</asp:ListItem>
                            <asp:ListItem>Prestamo Fiduciario Indirecto Bantrab</asp:ListItem>
                            <asp:ListItem>Factorje Fiduciario</asp:ListItem>
                            <asp:ListItem>Prestamo Bienes Inmuebles</asp:ListItem>
                            <asp:ListItem>Prestamo Bienes Inmuebles - Prendas</asp:ListItem>
                            <asp:ListItem>Prestamo Fiduciario - Prendas</asp:ListItem>
                            <asp:ListItem>Fiduciaria Otras Garantias</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="col-12 col-sm-6 col-md-4 col-lg-3 mb-3">
                        <label class="">Saldo de Deuda 2</label>
                        <asp:TextBox CssClass="form-control cotizador solo-numeros" runat="server" ID="saldoDeuda2"></asp:TextBox>
                    </div>
                    <div class="col-12 col-sm-6 col-md-4 col-lg-3 mb-3">
                        <label class="">Límite Tarjeta 2</label>
                        <asp:TextBox CssClass="form-control cotizador solo-numeros" runat="server" ID="limiteTarjeta2"></asp:TextBox>
                    </div>
                    <div class="col-12 col-sm-6 col-md-4 col-lg-3 mb-3">
                        <label class="">Cuota Deuda 2</label>
                        <asp:TextBox CssClass="form-control cotizador solo-numeros" runat="server" ID="cuotaDeuda2"></asp:TextBox>
                    </div>
                </div>
                <div class="row">
                    <div class="col-12 col-sm-6 col-md-4 col-lg-3 mb-3">
                        <label class="">Tipo Deuda 3</label>
                        <asp:DropDownList runat="server" CssClass="form-control cotizador" ID="tipoDeuda3">
                            <asp:ListItem></asp:ListItem>
                            <asp:ListItem>Tarjeta de Credito Interna</asp:ListItem>
                            <asp:ListItem>Tarjeta de Credito Mayor a 9 m</asp:ListItem>
                            <asp:ListItem>Tarjeta de Credito Menor a 9m</asp:ListItem>
                            <asp:ListItem>Prestamo Hipotecario</asp:ListItem>
                            <asp:ListItem>Prestamo Fiduciario</asp:ListItem>
                            <asp:ListItem>Prestamo Fiduciario Indirecto Bantrab</asp:ListItem>
                            <asp:ListItem>Factorje Fiduciario</asp:ListItem>
                            <asp:ListItem>Prestamo Bienes Inmuebles</asp:ListItem>
                            <asp:ListItem>Prestamo Bienes Inmuebles - Prendas</asp:ListItem>
                            <asp:ListItem>Prestamo Fiduciario - Prendas</asp:ListItem>
                            <asp:ListItem>Fiduciaria Otras Garantias</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="col-12 col-sm-6 col-md-4 col-lg-3 mb-3">
                        <label class="">Saldo de Deuda 3</label>
                        <asp:TextBox CssClass="form-control cotizador solo-numeros" runat="server" ID="saldoDeuda3"></asp:TextBox>
                    </div>
                    <div class="col-12 col-sm-6 col-md-4 col-lg-3 mb-3">
                        <label class="">Límite Tarjeta 3</label>
                        <asp:TextBox CssClass="form-control cotizador solo-numeros" runat="server" ID="limiteTarjeta3"></asp:TextBox>
                    </div>
                    <div class="col-12 col-sm-6 col-md-4 col-lg-3 mb-3">
                        <label class="">Cuota Deuda 3</label>
                        <asp:TextBox CssClass="form-control cotizador solo-numeros" runat="server" ID="cuotaDeuda3"></asp:TextBox>
                    </div>
                </div>
                <div class="row">
                    <div class="col-12 col-sm-6 col-md-4 col-lg-3 mb-3">
                        <label class="">Tipo Deuda 4</label>
                        <asp:DropDownList runat="server" CssClass="form-control cotizador" ID="tipoDeuda4">
                            <asp:ListItem></asp:ListItem>
                            <asp:ListItem>Tarjeta de Credito Interna</asp:ListItem>
                            <asp:ListItem>Tarjeta de Credito Mayor a 9 m</asp:ListItem>
                            <asp:ListItem>Tarjeta de Credito Menor a 9m</asp:ListItem>
                            <asp:ListItem>Prestamo Hipotecario</asp:ListItem>
                            <asp:ListItem>Prestamo Fiduciario</asp:ListItem>
                            <asp:ListItem>Prestamo Fiduciario Indirecto Bantrab</asp:ListItem>
                            <asp:ListItem>Factorje Fiduciario</asp:ListItem>
                            <asp:ListItem>Prestamo Bienes Inmuebles</asp:ListItem>
                            <asp:ListItem>Prestamo Bienes Inmuebles - Prendas</asp:ListItem>
                            <asp:ListItem>Prestamo Fiduciario - Prendas</asp:ListItem>
                            <asp:ListItem>Fiduciaria Otras Garantias</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="col-12 col-sm-6 col-md-4 col-lg-3 mb-3">
                        <label class="">Saldo de Deuda 4</label>
                        <asp:TextBox CssClass="form-control cotizador solo-numeros" runat="server" ID="saldoDeuda4"></asp:TextBox>
                    </div>
                    <div class="col-12 col-sm-6 col-md-4 col-lg-3 mb-3">
                        <label class="">Límite Tarjeta 4</label>
                        <asp:TextBox CssClass="form-control cotizador solo-numeros" runat="server" ID="limiteTarjeta4"></asp:TextBox>
                    </div>
                    <div class="col-12 col-sm-6 col-md-4 col-lg-3 mb-3">
                        <label class="">Cuota Deuda 4</label>
                        <asp:TextBox CssClass="form-control cotizador solo-numeros" runat="server" ID="cuotaDeuda4"></asp:TextBox>
                    </div>
                </div>
                <div class="row">
                    <div class="col-12 col-sm-6 col-md-4 col-lg-3 mb-3">
                        <label class="">Tipo Deuda 5</label>
                        <asp:DropDownList runat="server" CssClass="form-control cotizador" ID="tipoDeuda5">
                            <asp:ListItem></asp:ListItem>
                            <asp:ListItem>Tarjeta de Credito Interna</asp:ListItem>
                            <asp:ListItem>Tarjeta de Credito Mayor a 9 m</asp:ListItem>
                            <asp:ListItem>Tarjeta de Credito Menor a 9m</asp:ListItem>
                            <asp:ListItem>Prestamo Hipotecario</asp:ListItem>
                            <asp:ListItem>Prestamo Fiduciario</asp:ListItem>
                            <asp:ListItem>Prestamo Fiduciario Indirecto Bantrab</asp:ListItem>
                            <asp:ListItem>Factorje Fiduciario</asp:ListItem>
                            <asp:ListItem>Prestamo Bienes Inmuebles</asp:ListItem>
                            <asp:ListItem>Prestamo Bienes Inmuebles - Prendas</asp:ListItem>
                            <asp:ListItem>Prestamo Fiduciario - Prendas</asp:ListItem>
                            <asp:ListItem>Fiduciaria Otras Garantias</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="col-12 col-sm-6 col-md-4 col-lg-3 mb-3">
                        <label class="">Saldo de Deuda 5</label>
                        <asp:TextBox CssClass="form-control cotizador solo-numeros" runat="server" ID="saldoDeuda5"></asp:TextBox>
                    </div>
                    <div class="col-12 col-sm-6 col-md-4 col-lg-3 mb-3">
                        <label class="">Límite Tarjeta 5</label>
                        <asp:TextBox CssClass="form-control cotizador solo-numeros" runat="server" ID="limiteTarjeta5"></asp:TextBox>
                    </div>
                    <div class="col-12 col-sm-6 col-md-4 col-lg-3 mb-3">
                        <label class="">Cuota Deuda 5</label>
                        <asp:TextBox CssClass="form-control cotizador solo-numeros" runat="server" ID="cuotaDeuda5"></asp:TextBox>
                    </div>
                </div>
                <div class="row">
                    <div class="col-12 col-sm-6 col-md-4 col-lg-3 mb-3">
                        <label class="">Tipo Deuda 6</label>
                        <asp:DropDownList runat="server" CssClass="form-control cotizador" ID="tipoDeuda6">
                            <asp:ListItem></asp:ListItem>
                            <asp:ListItem>Tarjeta de Credito Interna</asp:ListItem>
                            <asp:ListItem>Tarjeta de Credito Mayor a 9 m</asp:ListItem>
                            <asp:ListItem>Tarjeta de Credito Menor a 9m</asp:ListItem>
                            <asp:ListItem>Prestamo Hipotecario</asp:ListItem>
                            <asp:ListItem>Prestamo Fiduciario</asp:ListItem>
                            <asp:ListItem>Prestamo Fiduciario Indirecto Bantrab</asp:ListItem>
                            <asp:ListItem>Factorje Fiduciario</asp:ListItem>
                            <asp:ListItem>Prestamo Bienes Inmuebles</asp:ListItem>
                            <asp:ListItem>Prestamo Bienes Inmuebles - Prendas</asp:ListItem>
                            <asp:ListItem>Prestamo Fiduciario - Prendas</asp:ListItem>
                            <asp:ListItem>Fiduciaria Otras Garantias</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="col-12 col-sm-6 col-md-4 col-lg-3 mb-3">
                        <label class="">Saldo de Deuda 6</label>
                        <asp:TextBox CssClass="form-control cotizador solo-numeros" runat="server" ID="saldoDeuda6"></asp:TextBox>
                    </div>
                    <div class="col-12 col-sm-6 col-md-4 col-lg-3 mb-3">
                        <label class="">Límite Tarjeta 6</label>
                        <asp:TextBox CssClass="form-control cotizador solo-numeros" runat="server" ID="limiteTarjeta6"></asp:TextBox>
                    </div>
                    <div class="col-12 col-sm-6 col-md-4 col-lg-3 mb-3">
                        <label class="">Cuota Deuda 6</label>
                        <asp:TextBox CssClass="form-control cotizador solo-numeros" runat="server" ID="cuotaDeuda6"></asp:TextBox>
                    </div>
                </div>  
            </div>
            <hr />
            <div class="row mb-2">
                <div class="col-12">
                    <label class="fw-bold">Estados de Cuenta</label>
                </div>
            </div>
            <div class="row">
                <div class="col-12 col-sm-6 col-md-4 mb-3">
                    <label class="">Estado cuenta Mes 1</label>
                    <asp:TextBox CssClass="form-control cotizador solo-numeros" runat="server" ID="mes1"></asp:TextBox>
                </div>
                <div class="col-12 col-sm-6 col-md-4 mb-3">
                    <label class="">Estado cuenta Mes 2</label>
                    <asp:TextBox CssClass="form-control cotizador solo-numeros" runat="server" ID="mes2"></asp:TextBox>
                </div>
                <div class="col-12 col-sm-6 col-md-4 mb-3">
                    <label class="">Estado cuenta Mes 3</label>
                    <asp:TextBox CssClass="form-control cotizador solo-numeros" runat="server" ID="mes3"></asp:TextBox>
                </div>
            </div>
            <hr />
            <div class="row mb-2">
                <div class="col-12">
                    <label class="fw-bold">Garantías</label>
                </div>
            </div>
            <div class="row">
                <div class="col-12 col-sm-6 mb-3">
                    <label class="">Terreno Garantía</label>
                    <asp:TextBox CssClass="form-control cotizador solo-numeros" runat="server" ID="terreno"></asp:TextBox>
                </div>
                <div class="col-12 col-sm-6 mb-3">
                    <label class="">Construcciones Garantía</label>
                    <asp:TextBox CssClass="form-control cotizador solo-numeros" runat="server" ID="construccion"></asp:TextBox>
                </div>
            </div>
            <hr />
            <div class="row mb-2">
                <div class="col-12">
                    <label class="fw-bold">Clasificaciones y Score</label>
                </div>
            </div>
            <div class="row">
                <div class="col-12 col-sm-6 col-md-4 mb-3">
                    <label class="">Score Predictivo</label>
                    <asp:TextBox CssClass="form-control cotizador solo-numeros" runat="server" ID="scorePredictivo"></asp:TextBox>
                </div>
                <div class="col-12 col-sm-6 col-md-4 mb-3">
                    <label class="">Clasificación SIB</label>
                    <asp:DropDownList CssClass="form-control cotizador" runat="server" ID="clasificacionSIB">
                        <asp:ListItem></asp:ListItem>
                        <asp:ListItem>A</asp:ListItem>
                        <asp:ListItem>B</asp:ListItem>
                        <asp:ListItem>C</asp:ListItem>
                        <asp:ListItem>D</asp:ListItem>
                        <asp:ListItem>E</asp:ListItem>
                        <asp:ListItem>S/C</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="col-12 col-sm-6 col-md-4 mb-3">
                    <label class="">Conteo CCR</label>
                    <asp:DropDownList CssClass="form-control cotizador" runat="server" ID="conteoCCR">
                        <asp:ListItem></asp:ListItem>
                        <asp:ListItem>1</asp:ListItem>
                        <asp:ListItem>2</asp:ListItem>
                        <asp:ListItem>3</asp:ListItem>
                        <asp:ListItem>4</asp:ListItem>
                        <asp:ListItem>5</asp:ListItem>
                        <asp:ListItem>6</asp:ListItem>
                        <asp:ListItem>mas de 6</asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>
            <div class="row">
                <div class="col-12 text-center">
                    <asp:Button CssClass="btn btn-primary btn-lg" runat="server" ID="btnCotizador" Text="COTIZAR" OnClick="btnCotizador_Click" style="margin: 20px 0; padding: 15px 40px; font-size: 18px; font-weight: bold;" />
                </div>
            </div>
        </div>
        <br />
        <div class="modal fade" id="modalArchivo" tabindex="-1" aria-labelledby="modalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="modalLabel">Archivos</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                    </div>
                    <div class="modal-body">
                        <div class="row mt-4">
                            <h2>Lista de Archivos</h2>
                            <div class="table-responsive">
                                <table class="table table-striped">
                                    <thead>
                                        <tr>
                                            <th>Archivo</th>
                                            <th>Descripción</th>
                                            <th>Acción</th>
                                        </tr>
                                    </thead>
                                    <tbody id="listaArchivos">
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-12">
                                <textarea id="contenidoArchivo" class="form-control" rows="10" style="width: 100%;"></textarea>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                        <button type="button" class="btn btn-primary" id="guardarArchivo">Guardar Cambios</button>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal fade" id="modalAdvertencia" tabindex="-1" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="modalTitulo">Cotizador</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                    </div>
                    <div class="modal-body" id="modalMensaje"></div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary btn-sm" data-bs-dismiss="modal">Cerrar</button>
                    </div>
                </div>
            </div>
        </div>
   
    </form>
</body>

    <script>
        // Función para limpiar formato de moneda (solo números)
        function limpiarFormatoMoneda(valor) {
            if (!valor || valor === '') return '';
            return valor.toString().replace(/[^\d.-]/g, '');
        }
        
        // Función para limpiar todos los campos de moneda antes de enviar
        function limpiarCamposMoneda() {
            var camposMoneda = [
                'montoSolicitado', 'ingresoConstancia', 'ingresoConstancia2',
                'bonificacionActividadEconomica', 'iggsActividadEconomica', 'isrActividadEconomica', 'comisionesActividadEconomica',
                'bonificacionActividadEconomica2', 'iggsActividadEconomica2', 'isrActividadEconomica2', 'comisionesActividadEconomica2',
                'descuentoConstancia', 'auxilioPostumo', 'montepio', 'seguro',
                'saldoDeuda1', 'saldoDeuda2', 'saldoDeuda3', 'saldoDeuda4', 'saldoDeuda5', 'saldoDeuda6',
                'limiteTarjeta1', 'limiteTarjeta2', 'limiteTarjeta3', 'limiteTarjeta4', 'limiteTarjeta5', 'limiteTarjeta6',
                'cuotaDeuda1', 'cuotaDeuda2', 'cuotaDeuda3', 'cuotaDeuda4', 'cuotaDeuda5', 'cuotaDeuda6',
                'mes1', 'mes2', 'mes3', 'terreno', 'construccion'
            ];
            
            camposMoneda.forEach(function(id) {
                var campo = document.getElementById(id);
                if (campo && campo.value) {
                    campo.value = limpiarFormatoMoneda(campo.value);
                }
            });
        }
        
        // Limpiar plazo cuando cambie tipo de garantía
        document.addEventListener('DOMContentLoaded', function() {
            var tipoGarantia = document.getElementById('tipoGarantia');
            if (tipoGarantia) {
                tipoGarantia.addEventListener('change', function() {
                    var plazoMeses = document.getElementById('plazoMeses');
                    if (plazoMeses) {
                        plazoMeses.value = '';
                    }
                });
            }
        });

        function cargarListaArchivos() {
            $("#contenidoArchivo").val("")
            $.ajax({
                type: "POST",
                url: "ConsumirWeb.aspx/ObtenerListaArchivos",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    $("#listaArchivos").empty();
                    response.d.forEach(archivo => {
                        $("#listaArchivos").append(`
                            <tr>
                                <td>${archivo.Nombre}</td>
                                <td>${archivo.Descripcion}</td>
                                <td>
                                    <button class="btn btn-sm btn-primary archivo-item" data-nombre="${archivo.Nombre}">
                                        Editar
                                    </button>
                                </td>
                            </tr>
                        `);
                    });
                    $("#modalArchivo").modal("show");
                }
            });
        }

        $(document).on("click", ".archivo-item", function () {
            let nombreArchivo = $(this).data("nombre");

            $.ajax({
                type: "POST",
                url: "ConsumirWeb.aspx/ObtenerContenidoArchivo",
                data: JSON.stringify({ strNombreArchivo: nombreArchivo }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    $("#contenidoArchivo").val(response.d);
                    $("#guardarArchivo").data("nombre", nombreArchivo);
                    $("#modalArchivo").modal("show");
                }
            });
            return false;
        });

        $("#guardarArchivo").click(function () {
            let strNombreArchivo = $(this).data("nombre");
            let strNuevoContenido = $("#contenidoArchivo").val();

            $.ajax({
                type: "POST",
                url: "ConsumirWeb.aspx/GuardarArchivo",
                data: JSON.stringify({ strNombreArchivo: strNombreArchivo, strNuevoContenido: strNuevoContenido }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    if (response.d.Item1 == 1) {
                        $("#modalArchivo").modal("hide");
                    }
                    alert(response.d.Item2)
                }
            });
        });

        function validarId(id) {
            if ($("#"+id).val() != "")
                return false
            return true
        }

        function Alerta(mensaje) {
            $("#modalMensaje").text(mensaje);
            $("#modalAdvertencia").modal("show");
        }
    </script>

    <script type="text/javascript">
        document.addEventListener("DOMContentLoaded", function () {
        var txt = document.getElementById("scorePredictivo");
        if (txt) {
            txt.addEventListener("input", function () {
                var value = parseFloat(txt.value);
                if (!isNaN(value)) {
                    if (value >= 0 && value <= 565) {
                        txt.style.backgroundColor = "#ffcccc"; // Rojo claro
                    }
                    else if (value < 0) {
                        txt.style.backgroundColor = "#ffffcc"; // amarillo claro
                    }
                    else {
                        txt.style.backgroundColor = "#ccffcc"; // Verde claro
                    }
                } else {
                    txt.style.backgroundColor = ""; // Sin color
                }
            });
        }

        var sib = document.getElementById("clasificacionSIB");
        if (sib) {
            sib.addEventListener("change", function () {
                var valor = sib.value;
                if (valor === "") {
                    sib.style.backgroundColor = ""; // sin color
                } else if (valor === "A") {
                    sib.style.backgroundColor = "#ccffcc"; // rojo claro
                } else if (valor === "B") {
                    sib.style.backgroundColor = "#ffffcc"; // amarillo claro
                } else {
                    sib.style.backgroundColor = "#ffcccc"; // rojo claro
                }
            });
        }

        var ccr = document.getElementById("conteoCCR");
        if (ccr) {
            ccr.addEventListener("input", function () {
                if (ccr.value.trim() !== "") {
                    ccr.style.backgroundColor = "#ffcccc"; // rojo claro
                } else {
                    ccr.style.backgroundColor = ""; // sin color
                }
            });
        }
    });
    </script>

    <script>
    document.addEventListener('DOMContentLoaded', function () {
      document.querySelectorAll('.solo-numeros').forEach(function(input) {
        input.addEventListener('input', function(e) {
          // Guardar la posición actual del cursor
          var cursorPos = this.selectionStart;
          var oldValue = this.value;
          
          // Permitir números, un punto decimal y hasta 2 decimales
          var value = this.value;
          
          // Remover caracteres no válidos (solo números y punto)
          value = value.replace(/[^0-9.]/g, '');
          
          // Asegurar que solo haya un punto decimal
          var dotCount = (value.match(/\./g) || []).length;
          if (dotCount > 1) {
            // Si hay más de un punto, mantener solo el primero
            var parts = value.split('.');
            value = parts[0] + '.' + parts.slice(1).join('');
          }
          
          // Limitar a máximo 2 decimales después del punto
          if (value.includes('.')) {
            var parts = value.split('.');
            if (parts[1] && parts[1].length > 2) {
              parts[1] = parts[1].substring(0, 2);
              value = parts[0] + '.' + parts[1];
            }
          }
          
          // Solo actualizar si el valor cambió
          if (value !== oldValue) {
            this.value = value;
            
            // Ajustar la posición del cursor
            if (cursorPos > value.length) {
              cursorPos = value.length;
            }
            
            // Restaurar la posición del cursor
            this.setSelectionRange(cursorPos, cursorPos);
          }
        });
      });
      
      // Control de habilitación del campo Tasa Referencia LIP y visibilidad de campos
      function toggleTasaReferenciaLIP() {
        var destinoCredito = document.getElementById('destinoCredito');
        var tasaReferenciaLIP = document.getElementById('tasaReferenciaLIP');
        var desgloseCuotasContainer = document.getElementById('desgloseCuotasContainer');
        var resultadosContainer = document.getElementById('resultadosContainer');
        
        if (destinoCredito && tasaReferenciaLIP) {
          var selectedValue = destinoCredito.value;
          
          // Habilitar solo si es LIP FHA o LIP DIRECTO
          if (selectedValue === 'LIP FHA' || selectedValue === 'LIP DIRECTO') {
            tasaReferenciaLIP.disabled = false;
            tasaReferenciaLIP.style.backgroundColor = '';
            tasaReferenciaLIP.classList.remove('campo-obligatorio-error');
            
            // Validar si el campo está vacío y marcarlo en rojo
            if (tasaReferenciaLIP.value === '' || tasaReferenciaLIP.value === '0') {
              tasaReferenciaLIP.classList.add('campo-obligatorio-error');
            }
            
            // Ocultar desglose de cuotas para LIP
            if (desgloseCuotasContainer) {
              desgloseCuotasContainer.style.display = 'none';
            }
            
            // Mostrar campos RCI específicos de LIP
            if (resultadosContainer) {
              var camposLIP = resultadosContainer.querySelectorAll('.campo-lip');
              camposLIP.forEach(function(campo) {
                campo.style.display = 'block';
              });
            }
          } else {
            tasaReferenciaLIP.disabled = true;
            tasaReferenciaLIP.value = '';
            tasaReferenciaLIP.style.backgroundColor = '#f8f9fa';
            tasaReferenciaLIP.classList.remove('campo-obligatorio-error');
            
            // Mostrar desglose de cuotas para otros destinos
            if (desgloseCuotasContainer) {
              desgloseCuotasContainer.style.display = 'block';
            }
            
            // Ocultar campos RCI específicos de LIP
            if (resultadosContainer) {
              var camposLIP = resultadosContainer.querySelectorAll('.campo-lip');
              camposLIP.forEach(function(campo) {
                campo.style.display = 'none';
              });
            }
          }
        }
      }
      
      // Ejecutar al cargar la página
      toggleTasaReferenciaLIP();
      
      // Ejecutar cuando cambie el destino de crédito
      var destinoCredito = document.getElementById('destinoCredito');
      if (destinoCredito) {
        destinoCredito.addEventListener('change', toggleTasaReferenciaLIP);
      }
      
      // Quitar error visual cuando el usuario escriba en el campo de tasa de referencia LIP
      var tasaReferenciaLIP = document.getElementById('tasaReferenciaLIP');
      if (tasaReferenciaLIP) {
        tasaReferenciaLIP.addEventListener('input', function() {
          if (this.value !== '' && this.value !== '0') {
            this.classList.remove('campo-obligatorio-error');
          }
        });
        
        tasaReferenciaLIP.addEventListener('blur', function() {
          var destinoCredito = document.getElementById('destinoCredito');
          if (destinoCredito && (destinoCredito.value === 'LIP FHA' || destinoCredito.value === 'LIP DIRECTO')) {
            if (this.value === '' || this.value === '0') {
              this.classList.add('campo-obligatorio-error');
            } else {
              this.classList.remove('campo-obligatorio-error');
            }
          }
        });
      }
    });
    </script>

    <script>
$(document).ready(function () {
    // IDs de campos obligatorios por tramo
    var camposObligatorios = [
        // Tramo principal
        "montoSolicitado", "destinoCredito", "tipoGarantia", "tasaInteres", "plazoMeses", "tipoCuota",
        // Ingresos
        "actividad", "ingresoConstancia"
        // Puedes agregar más campos según la lógica de negocio
    ];
    
    // Función para validar campos obligatorios específicos según destino de crédito
    function validarCamposEspecificos() {
        var destinoCredito = document.getElementById('destinoCredito');
        var tasaReferenciaLIP = document.getElementById('tasaReferenciaLIP');
        
        if (destinoCredito && tasaReferenciaLIP) {
            var selectedValue = destinoCredito.value;
            
            // Si es LIP FHA o LIP DIRECTO, validar que tenga tasa de referencia
            if (selectedValue === 'LIP FHA' || selectedValue === 'LIP DIRECTO') {
                if (tasaReferenciaLIP.value === '' || tasaReferenciaLIP.value === '0') {
                    tasaReferenciaLIP.classList.add('campo-obligatorio-error');
                    return false;
                } else {
                    tasaReferenciaLIP.classList.remove('campo-obligatorio-error');
                }
            }
        }
        return true;
    }

    // Quitar error al escribir
    camposObligatorios.forEach(function(id) {
        $("#" + id).on("input change", function() {
            if ($(this).val() !== "") {
                $(this).removeClass("campo-obligatorio-error");
            }
        });
    });

    // Función para limpiar formato de moneda (solo números)
    function limpiarFormatoMoneda(valor) {
        if (!valor || valor === '') return '';
        return valor.toString().replace(/[^\d.-]/g, '');
    }
    
    // Función para limpiar todos los campos de moneda antes de enviar
    function limpiarCamposMoneda() {
        var camposMoneda = [
            'montoSolicitado', 'ingresoConstancia', 'ingresoConstancia2',
            'bonificacionActividadEconomica', 'iggsActividadEconomica', 'isrActividadEconomica', 'comisionesActividadEconomica',
            'bonificacionActividadEconomica2', 'iggsActividadEconomica2', 'isrActividadEconomica2', 'comisionesActividadEconomica2',
            'descuentoConstancia', 'auxilioPostumo', 'montepio', 'seguro',
            'saldoDeuda1', 'saldoDeuda2', 'saldoDeuda3', 'saldoDeuda4', 'saldoDeuda5', 'saldoDeuda6',
            'limiteTarjeta1', 'limiteTarjeta2', 'limiteTarjeta3', 'limiteTarjeta4', 'limiteTarjeta5', 'limiteTarjeta6',
            'cuotaDeuda1', 'cuotaDeuda2', 'cuotaDeuda3', 'cuotaDeuda4', 'cuotaDeuda5', 'cuotaDeuda6',
            'mes1', 'mes2', 'mes3', 'terreno', 'construccion'
        ];
        
        camposMoneda.forEach(function(id) {
            var campo = document.getElementById(id);
            if (campo && campo.value) {
                campo.value = limpiarFormatoMoneda(campo.value);
            }
        });
    }
    
    // Validación visual al enviar
    $("#btnCotizador").on("click", function (e) {
        // Limpiar formato de moneda antes de validar
        limpiarCamposMoneda();
        
        var hayError = false;
        camposObligatorios.forEach(function(id) {
            var $campo = $("#" + id);
            if ($campo.length && ($campo.val() === null || $campo.val().trim() === "")) {
                $campo.addClass("campo-obligatorio-error");
                hayError = true;
            } else {
                $campo.removeClass("campo-obligatorio-error");
            }
        });
        
        // Validar campos específicos según destino de crédito
        if (!validarCamposEspecificos()) {
            hayError = true;
        }
        
        if (hayError) {
            e.preventDefault();
            e.stopPropagation();
            return false;
        }
        // Si no hay error, permitir submit normal
    });
});
</script>

<script>
$(document).ready(function() {
    // Función para formatear números como moneda guatemalteca
    function formatearMoneda(valor) {
        if (valor === undefined || valor === null || valor === '') return '';
        
        // Remover cualquier formato existente
        valor = valor.toString().replace(/[^\d.-]/g, '');
        
        // Convertir a número
        var numero = parseFloat(valor);
        if (isNaN(numero)) return '';
        
        // Formatear con separadores de miles y dos decimales
        var valorFormateado = numero.toLocaleString('es-GT', {
            minimumFractionDigits: 2,
            maximumFractionDigits: 2
        });
        
        // Agregar símbolo Q al principio
        return 'Q ' + valorFormateado;
    }
    
    // Función para limpiar formato de moneda (solo números)
    function limpiarFormatoMoneda(valor) {
        if (!valor || valor === '') return '';
        return valor.toString().replace(/[^\d.-]/g, '');
    }
    
    // Aplicar máscaras de moneda a campos de entrada
    var camposMoneda = [
        'montoSolicitado', 'ingresoConstancia', 'ingresoConstancia2',
        'bonificacionActividadEconomica', 'iggsActividadEconomica', 'isrActividadEconomica', 'comisionesActividadEconomica',
        'bonificacionActividadEconomica2', 'iggsActividadEconomica2', 'isrActividadEconomica2', 'comisionesActividadEconomica2',
        'descuentoConstancia', 'auxilioPostumo', 'montepio', 'seguro',
        'saldoDeuda1', 'saldoDeuda2', 'saldoDeuda3', 'saldoDeuda4', 'saldoDeuda5', 'saldoDeuda6',
        'limiteTarjeta1', 'limiteTarjeta2', 'limiteTarjeta3', 'limiteTarjeta4', 'limiteTarjeta5', 'limiteTarjeta6',
        'cuotaDeuda1', 'cuotaDeuda2', 'cuotaDeuda3', 'cuotaDeuda4', 'cuotaDeuda5', 'cuotaDeuda6',
        'mes1', 'mes2', 'mes3', 'terreno', 'construccion'
    ];
    
                    // Aplicar máscaras a campos de entrada
    camposMoneda.forEach(function(id) {
        var $campo = $('#' + id);
        if ($campo.length) {
            // Agregar clase visual
            $campo.addClass('campo-moneda');
            
            // Validar formato al perder el foco (más simple y sin problemas de cursor)
            $campo.on('blur', function() {
                var valor = $(this).val();
                if (valor && valor !== '') {
                    // Limpiar cualquier formato existente
                    valor = valor.replace(/[^\d.-]/g, '');
                    
                    // Convertir a número
                    var numero = parseFloat(valor);
                    if (!isNaN(numero)) {
                        // Aplicar formato de moneda
                        $(this).val(formatearMoneda(numero));
                    }
                }
            });
            
            // Limpiar formato al obtener el foco
            $campo.on('focus', function() {
                var valor = $(this).val();
                if (valor && valor !== '') {
                    // Limpiar formato y mostrar solo números
                    var numero = parseFloat(limpiarFormatoMoneda(valor));
                    if (!isNaN(numero)) {
                        $(this).val(numero.toString());
                    }
                }
            });
        }
    });
    
    // Formatear campos de resultados como moneda (solo visual)
    function formatearResultadosMoneda() {
        var camposResultado = [
            'noCuota', 'cuota1al48Total', 'cuota1al48Cliente', 'cuota49al84Total', 'cuota49al84Cliente',
            'cuota85masTotal', 'cuota85masCliente', 'bonificacionActividadEconomica', 'isrActividadEconomica',
            'iggsActividadEconomica', 'bonificacionActividadEconomica2', 'isrActividadEconomica2', 'iggsActividadEconomica2',
            'cuotaDeuda1', 'cuotaDeuda2', 'cuotaDeuda3', 'cuotaDeuda4', 'cuotaDeuda5', 'cuotaDeuda6'
        ];
        
        camposResultado.forEach(function(id) {
            var $campo = $('#' + id);
            if ($campo.length && $campo.val() !== undefined && $campo.val() !== '') {
                var numero = parseFloat($campo.val());
                if (!isNaN(numero)) {
                    $campo.addClass('campo-moneda');
                    $campo.val(formatearMoneda(numero));
                }
            }
        });
        
        // Formatear campos del desglose de cuotas (Labels) - solo agregar Q
        var camposDesglose = [
            'lblCapital', 'lblIntereses', 'lblCuotaSinSeguros', 'lblSeguroVida', 'lblSeguroDanios', 
            'lblCuotaTotal', 'lblEndeudamientoInterno', 'lblEndeudamientoExterno', 'lblCuotasVigentes'
        ];
        
        camposDesglose.forEach(function(id) {
            var $campo = $('#' + id);
            if ($campo.length && $campo.text() !== undefined && $campo.text() !== '') {
                var texto = $campo.text().trim();
                // Solo agregar Q si no la tiene ya
                if (texto && !texto.startsWith('Q')) {
                    $campo.text('Q ' + texto);
                }
            }
        });
    }
    
    // Formatear resultados después de cargar datos
    setTimeout(formatearResultadosMoneda, 500);
    
    // Formatear resultados después de cada cálculo
    $(document).on('DOMSubtreeModified', '#resultadosContainer', function() {
        setTimeout(formatearResultadosMoneda, 100);
    });
    
    // Función para formatear campos de entrada después de cotización
    function formatearCamposEntradaMoneda() {
        var camposEntrada = [
            'montoSolicitado', 'ingresoConstancia', 'ingresoConstancia2',
            'bonificacionActividadEconomica', 'iggsActividadEconomica', 'isrActividadEconomica', 'comisionesActividadEconomica',
            'bonificacionActividadEconomica2', 'iggsActividadEconomica2', 'isrActividadEconomica2', 'comisionesActividadEconomica2',
            'descuentoConstancia', 'auxilioPostumo', 'montepio', 'seguro',
            'saldoDeuda1', 'saldoDeuda2', 'saldoDeuda3', 'saldoDeuda4', 'saldoDeuda5', 'saldoDeuda6',
            'limiteTarjeta1', 'limiteTarjeta2', 'limiteTarjeta3', 'limiteTarjeta4', 'limiteTarjeta5', 'limiteTarjeta6',
            'cuotaDeuda1', 'cuotaDeuda2', 'cuotaDeuda3', 'cuotaDeuda4', 'cuotaDeuda5', 'cuotaDeuda6',
            'mes1', 'mes2', 'mes3', 'terreno', 'construccion'
        ];
        
        camposEntrada.forEach(function(id) {
            var $campo = $('#' + id);
            if ($campo.length && $campo.val() !== undefined && $campo.val() !== '') {
                var numero = parseFloat($campo.val());
                if (!isNaN(numero)) {
                    $campo.val(formatearMoneda(numero));
                }
            }
        });
    }
    
    // Formatear campos de entrada después de cotización
    setTimeout(formatearCamposEntradaMoneda, 1000);
    
    // Formatear campos de entrada cuando cambien los resultados
    $(document).on('DOMSubtreeModified', '#resultadosContainer', function() {
        setTimeout(formatearCamposEntradaMoneda, 200);
    });
    
    // Formatear campos de entrada después de postback de ASP.NET
    $(document).ready(function() {
        setTimeout(formatearCamposEntradaMoneda, 500);
    });
    
    // Formatear campos de entrada cuando se complete cualquier postback
    $(window).on('load', function() {
        setTimeout(formatearCamposEntradaMoneda, 300);
    });
});
</script>
</html>