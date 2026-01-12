Imports System.IO
Imports System.Net
Imports System.Net.Http
Imports System.Security.Policy
Imports System.Threading.Tasks
Imports System.Web.Script.Serialization
Imports System.Xml

Partial Class ConsumirWeb
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim strMetodo As String
        Dim strRespuesta As String

        'Try

        'Catch ex As Exception

        'End Try
    End Sub

    Public Function ConsumirServicio() As Task
        Dim client As New HttpClient()
        Dim url As String = "http://172.16.20.89:84/preCalificador.asmx/ObtenerDatos"
        'Dim url As String = ConfigurationManager.AppSettings("webServiceUrl")

        Try
            client.Timeout = TimeSpan.FromSeconds(30)

            url += "?dcmMontoSolicitado=" + montoSolicitado.Text + "&strDestinoCredito=" + destinoCredito.Text + "&strTipoGarantia=" + tipoGarantia.Text +
                    "&strActividadEconomica=" + actividad.Text + "&dcmIngresoConstancia=" + ingresoConstancia.Text + "&strActividadEconomica2=" + actividad2.Text +
                    "&strIngresoConstancia2=" + ingresoConstancia2.Text + "&strAuxilioPostumo=" + auxilioPostumo.Text + "&strMontepio=" + montepio.Text +
                    "&strSeguros=" + seguro.Text + "&strDescuentoConstancia=" + descuentoConstancia.Text +
                    "&strTipoDeuda1=" + tipoDeuda1.Text + "&strSaldoDeuda1=" + saldoDeuda1.Text + "&strLimiteTarjeta1=" + limiteTarjeta1.Text + "&strCuotaDeuda1=" + cuotaDeuda1.Text +
                    "&strTipoDeuda2=" + tipoDeuda2.Text + "&strSaldoDeuda2=" + saldoDeuda2.Text + "&strLimiteTarjeta2=" + limiteTarjeta2.Text + "&strCuotaDeuda2=" + cuotaDeuda2.Text +
                    "&strTipoDeuda3=" + tipoDeuda3.Text + "&strSaldoDeuda3=" + saldoDeuda3.Text + "&strLimiteTarjeta3=" + limiteTarjeta3.Text + "&strCuotaDeuda3=" + cuotaDeuda3.Text +
                    "&strTipoDeuda4=" + tipoDeuda4.Text + "&strSaldoDeuda4=" + saldoDeuda4.Text + "&strLimiteTarjeta4=" + limiteTarjeta4.Text + "&strCuotaDeuda4=" + cuotaDeuda4.Text +
                    "&strTipoDeuda5=" + tipoDeuda5.Text + "&strSaldoDeuda5=" + saldoDeuda5.Text + "&strLimiteTarjeta5=" + limiteTarjeta5.Text + "&strCuotaDeuda5=" + cuotaDeuda5.Text +
                    "&strTipoDeuda6=" + tipoDeuda6.Text + "&strSaldoDeuda6=" + saldoDeuda6.Text + "&strLimiteTarjeta6=" + limiteTarjeta6.Text + "&strCuotaDeuda6=" + cuotaDeuda6.Text +
                    "&strMes1=" + mes1.Text + "&strMes2=" + mes2.Text + "&strMes3=" + mes3.Text + "&strTerreno=" + terreno.Text + "&strConstrucciones=" + construccion.Text +
                    "&strScorePredictivo=" + scorePredictivo.Text + "&strClasificacionSIB=" + clasificacionSIB.Text + "&strConteoCCR=" + conteoCCR.Text + "&strPlazoMeses=" + plazoMeses.Text +
                    "&strBonificacionActividadEconomica=" + bonificacionActividadEconomica.Text +
                    "&strIgssActividadEconomica=" + iggsActividadEconomica.Text +
                    "&strIsrActividadEconomica=" + isrActividadEconomica.Text +
                    "&strBonificacionActividadEconomica2=" + bonificacionActividadEconomica2.Text +
                    "&strIgssActividadEconomica2=" + iggsActividadEconomica2.Text +
                    "&strIsrActividadEconomica2=" + isrActividadEconomica2.Text +
                    "&strComisionesActividadEconomica=" + comisionesActividadEconomica.Text +
                    "&strComisionesActividadEconomica2=" + comisionesActividadEconomica2.Text +
                    "&strTasaInteres=" + tasaInteres.Text + "&strTipoCuota=" + tipoCuota.SelectedValue +
                    "&strTasaReferenciaLIP=" + tasaReferenciaLIP.Text

            Dim response As HttpResponseMessage = client.GetAsync(url).Result

            If response.IsSuccessStatusCode Then
                Dim content As String = response.Content.ReadAsStringAsync().Result
                Dim xmlDoc As New XmlDocument()
                xmlDoc.LoadXml(content)
                Dim plazoMesesEnviado As Decimal = 0
                If Not String.IsNullOrEmpty(plazoMeses.Text) Then
                    plazoMesesEnviado = Convert.ToDecimal(plazoMeses.Text)
                End If

                ' Dim tasaInteres As String = xmlDoc.SelectSingleNode("//tasaInteres").InnerText
                ' Dim plazoMeses As String = xmlDoc.SelectSingleNode("//plazoMeses").InnerText
                noCuota.Text = xmlDoc.SelectSingleNode("//noCuota").InnerText
                rci.Text = xmlDoc.SelectSingleNode("//rci").InnerText
                'Dim bonificacionActividadEconomica As String = xmlDoc.SelectSingleNode("//bonificacionActividadEconomica").InnerText
                'Dim igssActividadEconomica As String = xmlDoc.SelectSingleNode("//igssActividadEconomica").InnerText
                'Dim isrActividadEconomica As String = xmlDoc.SelectSingleNode("//isrActividadEconomica").InnerText
                'Dim bonificacionActividadEconomica2 As String = xmlDoc.SelectSingleNode("//bonificacionActividadEconomica2").InnerText
                'Dim igssActividadEconomica2 As String = xmlDoc.SelectSingleNode("//igssActividadEconomica2").InnerText
                'Dim isrActividadEconomica2 As String = xmlDoc.SelectSingleNode("//isrActividadEconomica2").InnerText
                Dim cuota As String = xmlDoc.SelectSingleNode("//cuota").InnerText
                ' totalCuotasDirectas ya no se usa, se eliminó del frontend
                Dim valorGarantiaHipotecaria As String = xmlDoc.SelectSingleNode("//valorGarantiaHipotecaria").InnerText
                rdg.Text = xmlDoc.SelectSingleNode("//rdg").InnerText
                ' Los campos valorDiferente y rciDiferente ya no se usan, se reemplazaron por los nuevos campos RCI
                Dim trfLip As String = xmlDoc.SelectSingleNode("//trfLip").InnerText
                ' Mostrar el detalle
                detalle.Text = xmlDoc.SelectSingleNode("//detalle").InnerText
                plazoMeses.Text = xmlDoc.SelectSingleNode("//plazoMeses").InnerText
                tasaInteres.Text = xmlDoc.SelectSingleNode("//tasaInteres").InnerText.Replace("%", "")
                bonificacionActividadEconomica.Text = xmlDoc.SelectSingleNode("//bonificacionActividadEconomica").InnerText
                isrActividadEconomica.Text = xmlDoc.SelectSingleNode("//isrActividadEconomica").InnerText
                iggsActividadEconomica.Text = xmlDoc.SelectSingleNode("//igssActividadEconomica").InnerText
                bonificacionActividadEconomica2.Text = xmlDoc.SelectSingleNode("//bonificacionActividadEconomica2").InnerText
                isrActividadEconomica2.Text = xmlDoc.SelectSingleNode("//isrActividadEconomica2").InnerText
                iggsActividadEconomica2.Text = xmlDoc.SelectSingleNode("//igssActividadEconomica2").InnerText

                ' Mostrar mensaje de advertencia si existe
                lblPlazoAdvertencia.Text = xmlDoc.SelectSingleNode("//plazoAdvertencia").InnerText

                ' Procesar los nuevos campos RCI según plazo
                If xmlDoc.SelectSingleNode("//rci1al48") IsNot Nothing Then
                    rci1al48.Text = xmlDoc.SelectSingleNode("//rci1al48").InnerText
                End If
                If xmlDoc.SelectSingleNode("//rci1al48Total") IsNot Nothing Then
                    rci1al48Total.Text = xmlDoc.SelectSingleNode("//rci1al48Total").InnerText
                End If
                If xmlDoc.SelectSingleNode("//rci49al84") IsNot Nothing Then
                    rci49al84.Text = xmlDoc.SelectSingleNode("//rci49al84").InnerText
                End If
                If xmlDoc.SelectSingleNode("//rci49al84Total") IsNot Nothing Then
                    rci49al84Total.Text = xmlDoc.SelectSingleNode("//rci49al84Total").InnerText
                End If
                If xmlDoc.SelectSingleNode("//rci85mas") IsNot Nothing Then
                    rci85mas.Text = xmlDoc.SelectSingleNode("//rci85mas").InnerText
                End If
                If xmlDoc.SelectSingleNode("//rci85masTotal") IsNot Nothing Then
                    rci85masTotal.Text = xmlDoc.SelectSingleNode("//rci85masTotal").InnerText
                End If

                ' Procesar los campos de cuota
                If xmlDoc.SelectSingleNode("//cuota1al48Cliente") IsNot Nothing Then
                    cuota1al48Cliente.Text = xmlDoc.SelectSingleNode("//cuota1al48Cliente").InnerText
                End If
                If xmlDoc.SelectSingleNode("//cuota1al48Total") IsNot Nothing Then
                    cuota1al48Total.Text = xmlDoc.SelectSingleNode("//cuota1al48Total").InnerText
                End If
                If xmlDoc.SelectSingleNode("//cuota49al84Cliente") IsNot Nothing Then
                    cuota49al84Cliente.Text = xmlDoc.SelectSingleNode("//cuota49al84Cliente").InnerText
                End If
                If xmlDoc.SelectSingleNode("//cuota49al84Total") IsNot Nothing Then
                    cuota49al84Total.Text = xmlDoc.SelectSingleNode("//cuota49al84Total").InnerText
                End If
                If xmlDoc.SelectSingleNode("//cuota85masCliente") IsNot Nothing Then
                    cuota85masCliente.Text = xmlDoc.SelectSingleNode("//cuota85masCliente").InnerText
                End If
                If xmlDoc.SelectSingleNode("//cuota85masTotal") IsNot Nothing Then
                    cuota85masTotal.Text = xmlDoc.SelectSingleNode("//cuota85masTotal").InnerText
                End If

                ' Mostrar los cálculos de endeudamiento
                If xmlDoc.SelectSingleNode("//endeudamiento1") IsNot Nothing Then
                    cuotaDeuda1.Text = xmlDoc.SelectSingleNode("//endeudamiento1").InnerText
                End If
                If xmlDoc.SelectSingleNode("//endeudamiento2") IsNot Nothing Then
                    cuotaDeuda2.Text = xmlDoc.SelectSingleNode("//endeudamiento2").InnerText
                End If
                If xmlDoc.SelectSingleNode("//endeudamiento3") IsNot Nothing Then
                    cuotaDeuda3.Text = xmlDoc.SelectSingleNode("//endeudamiento3").InnerText
                End If
                If xmlDoc.SelectSingleNode("//endeudamiento4") IsNot Nothing Then
                    cuotaDeuda4.Text = xmlDoc.SelectSingleNode("//endeudamiento4").InnerText
                End If
                If xmlDoc.SelectSingleNode("//endeudamiento5") IsNot Nothing Then
                    cuotaDeuda5.Text = xmlDoc.SelectSingleNode("//endeudamiento5").InnerText
                End If
                If xmlDoc.SelectSingleNode("//endeudamiento6") IsNot Nothing Then
                    cuotaDeuda6.Text = xmlDoc.SelectSingleNode("//endeudamiento6").InnerText
                End If

                ' Desglose de cuota
                Dim seguroVida As Decimal = 0
                Dim seguroDanios As Decimal = 0
                Dim cuotaSinSeguros As Decimal = 0
                Dim capital As Decimal = 0
                Dim intereses As Decimal = 0
                Dim cuotaTotal As Decimal = 0
                Dim cuotasVigentes As Decimal = 0
                Dim endeudamientoInterno As Decimal = 0
                Dim endeudamientoExterno As Decimal = 0

                If xmlDoc.SelectSingleNode("//seguroVida") IsNot Nothing Then
                    Decimal.TryParse(xmlDoc.SelectSingleNode("//seguroVida").InnerText, seguroVida)
                End If
                If xmlDoc.SelectSingleNode("//seguroDanios") IsNot Nothing Then
                    Decimal.TryParse(xmlDoc.SelectSingleNode("//seguroDanios").InnerText, seguroDanios)
                End If
                If xmlDoc.SelectSingleNode("//cuota") IsNot Nothing Then
                    Decimal.TryParse(xmlDoc.SelectSingleNode("//cuota").InnerText, cuotaSinSeguros)
                End If
                If xmlDoc.SelectSingleNode("//endeudamientoInterno") IsNot Nothing Then
                    Decimal.TryParse(xmlDoc.SelectSingleNode("//endeudamientoInterno").InnerText, endeudamientoInterno)
                End If
                If xmlDoc.SelectSingleNode("//endeudamientoExterno") IsNot Nothing Then
                    Decimal.TryParse(xmlDoc.SelectSingleNode("//endeudamientoExterno").InnerText, endeudamientoExterno)
                End If

                cuotaTotal = cuotaSinSeguros + seguroVida + seguroDanios
                cuotasVigentes = cuotaTotal + endeudamientoInterno + endeudamientoExterno

                ' Cálculo de capital e intereses del primer mes
                Dim monto As Decimal = 0
                Dim tasaAnual As Decimal = 0
                Dim plazoMesesInt As Integer = 0
                Dim tasaMensual As Decimal = 0

                Decimal.TryParse(montoSolicitado.Text, monto)
                Decimal.TryParse(tasaInteres.Text, tasaAnual)
                Integer.TryParse(plazoMeses.Text, plazoMesesInt)

                tasaAnual = tasaAnual / 100D ' Convertir a decimal
                tasaMensual = tasaAnual / 12D

                Dim tipoCuotaSeleccionada As String = tipoCuota.SelectedValue.ToLower()
                Dim capitalPrimerMes As Decimal = 0
                Dim interesPrimerMes As Decimal = 0
                If tipoCuotaSeleccionada = "saldos" Then
                    If plazoMesesInt > 0 Then
                        capitalPrimerMes = monto / plazoMesesInt
                    End If
                    interesPrimerMes = monto * tasaAnual / 360D * 30D
                    cuotaSinSeguros = capitalPrimerMes + interesPrimerMes
                Else
                    interesPrimerMes = monto * tasaMensual
                    capitalPrimerMes = cuotaSinSeguros - interesPrimerMes
                End If
                lblCapital.Text = capitalPrimerMes.ToString("N2")
                lblIntereses.Text = interesPrimerMes.ToString("N2")
                lblCuotaSinSeguros.Text = cuotaSinSeguros.ToString("N2")
                lblSeguroVida.Text = seguroVida.ToString("N2")
                lblSeguroDanios.Text = seguroDanios.ToString("N2")
                lblCuotaTotal.Text = cuotaTotal.ToString("N2")
                lblCuotasVigentes.Text = cuotasVigentes.ToString("N2")
                lblEndeudamientoInterno.Text = endeudamientoInterno.ToString("N2")
                lblEndeudamientoExterno.Text = endeudamientoExterno.ToString("N2")

                If plazoMesesEnviado > 0 And plazoMesesEnviado > Convert.ToDecimal(plazoMeses.Text) Then
                    ScriptManager.RegisterStartupScript(Me, Me.GetType(), "ShowModal", "$('#modalAdvertencia').modal('show');", True)
                    ScriptManager.RegisterStartupScript(Me, Me.GetType(), "alert", "alert('Cuota alta');", True)
                End If

                ' Script para aplicar colores a los campos después del postback
                ScriptManager.RegisterStartupScript(Me, Me.GetType(), "ApplyColors", "
                    setTimeout(function() {
                        // Aplicar color al scorePredictivo
                        var txt = document.getElementById('scorePredictivo');
                        if (txt && txt.value !== '') {
                            var value = parseFloat(txt.value);
                            if (!isNaN(value)) {
                                if (value >= 0 && value <= 565) {
                                    txt.style.backgroundColor = '#ffcccc'; // Rojo claro
                                } else if (value < 0) {
                                    txt.style.backgroundColor = '#ffffcc'; // Amarillo claro
                                } else {
                                    txt.style.backgroundColor = '#ccffcc'; // Verde claro
                                }
                            }
                        }
                        
                        // Aplicar color al clasificacionSIB
                        var sib = document.getElementById('clasificacionSIB');
                        if (sib && sib.value !== '') {
                            var valor = sib.value;
                            if (valor === 'A') {
                                sib.style.backgroundColor = '#ccffcc'; // Verde claro
                            } else if (valor === 'B') {
                                sib.style.backgroundColor = '#ffffcc'; // Amarillo claro
                            } else {
                                sib.style.backgroundColor = '#ffcccc'; // Rojo claro
                            }
                        }
                        
                        // Aplicar color al conteoCCR
                        var ccr = document.getElementById('conteoCCR');
                        if (ccr && ccr.value !== '') {
                            ccr.style.backgroundColor = '#ffcccc'; // Rojo claro
                        }
                    }, 100);
                ", True)

            Else
                Console.WriteLine($"Error: {response.StatusCode} - {response.ReasonPhrase}")
            End If
        Catch ex As Exception
            Console.WriteLine("Error: " & ex.Message)
        End Try
    End Function

    Protected Sub btnCotizador_Click(sender As Object, e As EventArgs)
        ConsumirServicio()
    End Sub

    <System.Web.Services.WebMethod()>
    Public Shared Function ObtenerListaArchivos() As List(Of Object)
        Dim strArchivos = New List(Of Object)
        Dim strRuta As String

        strRuta = ConfigurationManager.AppSettings("pathArchivos")

        If Directory.Exists(strRuta) Then
            Dim archivos = Directory.GetFiles(strRuta, "*.xml").Select(Function(f) Path.GetFileName(f))
            For Each archivo In archivos
                Dim descripcion As String = ""
                Select Case archivo.ToLower()
                    Case "plazomeses_tipogarantia.xml"
                        descripcion = "Define los plazos máximos en meses para cada tipo de garantía"
                    Case "igss_isr.xml"
                        descripcion = "Contiene los porcentajes de IGSS e ISR aplicables"
                    Case "plazotasa_tipodeuda.xml"
                        descripcion = "Define los plazos y tasas promedio para cada tipo de deuda"
                    Case "polizaseguro.xml"
                        descripcion = "Contiene los parámetros para el cálculo de pólizas de seguro"
                    Case "tasas.xml"
                        descripcion = "Define las tasas de interés para cada tipo de préstamo"
                    Case Else
                        descripcion = "Archivo de configuración del sistema"
                End Select

                strArchivos.Add(New With {
                    .Nombre = archivo,
                    .Descripcion = descripcion
                })
            Next
        End If

        Return strArchivos
    End Function


    <System.Web.Services.WebMethod()>
    Public Shared Function ObtenerContenidoArchivo(strNombreArchivo As String) As String
        Dim strRutaArchivo As String = Path.Combine(ConfigurationManager.AppSettings("pathArchivos"), strNombreArchivo)

        If File.Exists(strRutaArchivo) Then
            Return File.ReadAllText(strRutaArchivo)
        Else
            Return "Error: El archivo no existe"
        End If

    End Function

    <System.Web.Services.WebMethod()>
    Public Shared Function GuardarArchivo(strNombreArchivo As String, strNuevoContenido As String) As (Integer, String)
        Dim strRutaArchivo As String = Path.Combine(ConfigurationManager.AppSettings("pathArchivos"), strNombreArchivo)

        Try
            Dim xmlDoc As New XmlDocument()
            xmlDoc.LoadXml(strNuevoContenido)

            File.WriteAllText(strRutaArchivo, strNuevoContenido)
            Return (1, "Archivo guardado correctamente.")
        Catch ex As Exception
            Return (0, "ERROR: El contenido no es un XML válido.")
        End Try
    End Function


    'Public Sub EscribirRegistro(strMensaje As String)
    '    Dim strRuta As String
    '    strRuta = Server.MapPath("~/Archivos/Prueba.txt")
    '    Try
    '        Using writer As StreamWriter = New StreamWriter(strRuta, True)
    '            writer.WriteLine($"{DateTime.Now.ToString("dd-MM-yyyy HH:mm:ss")} - {strMensaje}")
    '        End Using
    '    Catch ex As Exception
    '        Console.WriteLine($"Error al escribir en el log: {ex.Message}")
    '    End Try

    'End Sub

End Class
