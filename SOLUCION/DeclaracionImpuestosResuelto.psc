Algoritmo DeclaracionImpuestosResuelto
	sueldosAño=12
	numeroCategorias=6
	lim=10
	Dimension PorcentajeDeduccion[100]
	PorcentajeDeduccion[1]=0.2
	PorcentajeDeduccion[2]=0.35
	PorcentajeDeduccion[3]=0.4
	PorcentajeDeduccion[4]=0.1
	PorcentajeDeduccion[5]=0.4
	PorcentajeDeduccion[6]=0.1
	Dimension Impuesto[100]
	Impuesto[1]=0
	Impuesto[2]=0
	Impuesto[3]=163
	Impuesto[4]=615
	Impuesto[5]=1377
	Impuesto[6]=2611
	Impuesto[7]=4841
	Impuesto[8]=8602
	Impuesto[9]=14648
	Impuesto[9]=23956
	Dimension FraccionBasica[100]
	FraccionBasica[1]=11902
	FraccionBasica[2]=15159
	FraccionBasica[3]=19682
	FraccionBasica[4]=26031
	FraccionBasica[5]=34255
	FraccionBasica[6]=45407
	FraccionBasica[7]=60450
	FraccionBasica[8]=80605
	FraccionBasica[9]=107199
	Dimension Tasa[100]
	Tasa[1]=0
	Tasa[2]=0.05
	Tasa[3]=0.1
	Tasa[4]=0.12
	Tasa[5]=0.15
	Tasa[6]=0.2
	Tasa[7]=0.25
	Tasa[8]=0.3
	Tasa[9]=0.35
	Tasa[10]=0.37
	Dimension Meses[sueldosAño]
	Meses[1]="Enero"
	Meses[2]="Febrero"
	Meses[3]="Marzo"
	Meses[4]="Abril"
	Meses[5]="Mayo"
	Meses[6]="Junio"
	Meses[7]="Julio"
	Meses[8]="Agosto"
	Meses[9]="Septiembre"
	Meses[10]="Octubre"
	Meses[11]="Noviembre"
	Meses[12]="Diciembre"
	Dimension Categorias[numeroCategorias]
	Categorias[1]="Vivienda"
	Categorias[2]="Educación"
	Categorias[3]="Alimentación"
	Categorias[4]="Vestimenta"
	Categorias[5]="Salud"
	Categorias[6]="Turismo"
	Dimension SueldoMensual[sueldosAño]
	Dimension DineroCategorias[numeroCategorias]
	Dimension TotalCategorias[sueldosAño]
	SueldosMensuales(SueldoMensual, sueldosAño)
	GenerarFacturas(DineroCategorias, Categorias, Meses, sueldosAño)
	MostrarSueldosMensuales(Meses, SueldoMensual, sueldosAño)
	TablaGastos(DineroCategorias, Categorias, numeroCategorias, PorcentajeDeduccion)
	CalculoImpuestos(DineroCategorias, SueldoMensual, numeroCategorias, sueldosAño, FraccionBasica, Tasa,Impuesto)
FinAlgoritmo

SubProceso SueldosMensuales(SueldoMensual, sueldosAño)
	Sueldo=Aleatorio(900,2000)
	Para i=1 Hasta sueldosAño Con Paso 1 Hacer
		SueldoMensual[i]=Sueldo
	FinPara
FinSubProceso

SubProceso GenerarFacturas(DineroCategorias, Categorias, Meses, sueldosAño)
	Para l=1 Hasta sueldosAño Con Paso 1 Hacer
		Escribir "--------------Facturas de ", Meses[l], "--------------"
		NumAleatorio= Aleatorio(3,10)
		Facturas=Aleatorio(3,10)
		Para k=1 Hasta Facturas Con Paso 1 Hacer
			Escribir "Factura ",[k],":"
			Total=0
			Para i=1 Hasta NumAleatorio Con Paso 1 Hacer
				Continuar=Verdadero
				NumAleatorio2=Aleatorio(1,6)
				Valor1=Aleatorio(10,40)
				Total=Total+Valor1
				j=1
				Mientras Continuar Hacer
					Si j==NumAleatorio2
						Escribir Categorias[j], ": " ,Valor1
						DineroCategorias[j]=DineroCategorias[j]+Valor1
						Continuar=Falso
					SiNo
						j=j+1
					FinSi
				FinMientras
			FinPara
			Escribir "Total: ", Total
			Escribir ""
		FinPara
	FinPara
FinSubProceso

SubProceso MostrarSueldosMensuales(Meses, SueldoMensual, sueldosAño)
	Escribir "----------------------------------------------------------------------Sueldos Mensuales----------------------------------------------------------------------"
	Escribir "Meses  |  " Sin Saltar
	Para i=1 Hasta sueldosAño Con Paso 1 Hacer
		Escribir Meses[i], "  |  " Sin Saltar
	FinPara
	Escribir ""
	Escribir "Sueldos|   " Sin Saltar
	Para i=1 Hasta sueldosAño Con Paso 1 Hacer
		Escribir SueldoMensual[i], "    |    " Sin Saltar
		Total=Total+SueldoMensual[i]
	FinPara
	Escribir ""
	Escribir "Total: ",Total
	Escribir ""
FinSubProceso

SubProceso TablaGastos(DineroCategorias, Categorias, numeroCategorias, PorcentajeDeduccion)
	Escribir "------------------------------------------------------------------Total de las Categorias------------------------------------------------------------------"
	Escribir "Categorias  |  " Sin Saltar
	Para i=1 Hasta numeroCategorias Con Paso 1 Hacer
		Escribir Categorias[i], "  |  " Sin Saltar
	FinPara
	Escribir ""
	Escribir "Total  |   " Sin Saltar
	Para i=1 Hasta numeroCategorias Con Paso 1 Hacer
		Escribir DineroCategorias[i], "    |    " Sin Saltar
	FinPara
	Escribir ""
	Escribir "Deducción  |   " Sin Saltar
	Para i=1 Hasta numeroCategorias Con Paso 1 Hacer
		DineroCategorias[i]=DineroCategorias[i]*PorcentajeDeduccion[i]
		Escribir DineroCategorias[i], "    |    " Sin Saltar
		Total=Total+DineroCategorias[i]
	FinPara
	Escribir ""
	Escribir "Total: ",Total
	Escribir ""
FinSubProceso

SubProceso CalculoImpuestos(DineroCategorias, SueldoMensual, numeroCategorias, sueldosAño, FraccionBasica, Tasa,Impuesto)
	Maximo=5327
	Escribir "------------------------------------------------------------------Calculo de Impuestos------------------------------------------------------------------"
	Para i=1 Hasta sueldosAño Con Paso 1 Hacer
		SueldoAnual=SueldoAnual+SueldoMensual[i]
	FinPara
	Escribir "Total: ",SueldoAnual
	Para i=1 Hasta numeroCategorias Con Paso 1 Hacer
		Deduccion=DineroCategorias[i]+Deduccion
	FinPara
	Si (Deduccion>Maximo)
		Deduccion=Maximo
	FinSi
	Escribir "Total deducciones por facturas: ", Deduccion
	Escribir "Formula=((SueldoAnual-Deducciones)*Tasa)+FraccionBasica"
	Escribir "Impuestos totales a pagar: ", Formula(Deduccion, SueldoAnual, FraccionBasica, Tasa,Impuesto)
FinSubProceso

Funcion DevolverFormula=Formula(Deduccion, SueldoAnual, FraccionBasica, Tasa,Impuesto)
	DevolverFormula=SueldoAnual-Deduccion
	Continuar=Verdadero
	i=1
	Mientras Continuar Hacer
		Si (DevolverFormula<FraccionBasica[i]) Entonces
			DevolverFormula=(DevolverFormula*Tasa[i])+Impuesto[i]
			Continuar=Falso
		SiNo
			i=i+1
		FinSi
	FinMientras
FinFuncion
	