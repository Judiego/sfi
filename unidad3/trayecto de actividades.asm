ejercicio 1
-¿como se ve un protocolo binario?:
Un protocolo binario está representado por un conjunto de reglas que determinan cómo se estructuran y transmiten los datos. Esto implica organizar bits y bytes en mensajes que el dispositivo pueda interpretar. Normalmente, un documento técnico o una hoja de datos incluirá un diagrama que muestra el formato del mensaje, incluido el título, los datos y la posible validación.

-¿puedes escribir las partes de un mensaje?:
Encabezados: contiene información sobre el mensaje, como el tamaño, el tipo de mensaje y la dirección del remitente.
Datos: información que se transmite, como lecturas de sensores o comandos.
Verificación: puede incluir una CRC (verificación de redundancia cíclica) o una suma de verificación para verificar la integridad de los datos.

-¿Para qué sirve cada parte del mensaje?:
Encabezados: Facilitan el enrutamiento y procesamiento de mensajes.
Datos: es el contenido básico que necesita el destinatario.
Verificación: asegúrese de que los datos no se hayan dañado durante la transmisión.

ejercicio 2
Este método no se utiliza en el protocolo binario porque, a diferencia del protocolo ASCII, los caracteres de terminación como \n no se utilizan para indicar el final del mensaje.

ejercicio 4
-¿En qué endian estamos transmitiendo el número?
La transmisión se realiza en el formato de endian del sistema

ejercicio 5
void setup() {
    // Inicializamos la comunicación serie a 115200 baudios
    Serial.begin(115200);
}

void loop() {
    // Creamos un arreglo de números flotantes
    static float nums[3] = {3589.3645, 42.0, 123.456};
    // Creamos un arreglo para almacenar bytes
    static uint8_t arr[4] = {0};

    // Comprobamos si hay datos disponibles en la entrada serie
    if (Serial.available()) {
        // Lee carácter de la entrada
        if (Serial.read() == 's') {
            // Itera sobre nuestro arreglo de números
            for (int i = 0; i < 3; i++) {
                // Copia número flotante a arreglo de bytes
                memcpy(arr, (uint8_t *)&nums[i], 4);
                // Envia arreglo de bytes a la comunicación serie
                Serial.write(arr, 4);
            }
        }
    }
}

ejercicio 6
SerialPort _serialPort = new SerialPort();
_serialPort.PortName = "/dev/ttyUSB0";  // Nombre del puerto serial
_serialPort.BaudRate = 115200;          // Velocidad de transmisión
_serialPort.DtrEnable = true;           // Habilita el control de flujo
_serialPort.Open();                      // Abre el puerto serial

Configura y abre el puerto serie para comunicación.

byte[] data = { 0x01, 0x3F, 0x45 };
_serialPort.Write(data, 0, 1);  // Escribe el primer byte en el puerto serie

Envía un byte de datos al puerto serie.

byte[] buffer = new byte[4];
if (_serialPort.BytesToRead >= 4) {
    _serialPort.Read(buffer, 0, 4);  // Lee 4 bytes del puerto serie
    for (int i = 0; i < 4; i++) {
        Console.Write(buffer[i].ToString("X2") + " ");  // Imprime los bytes en formato hexadecimal
    }
}

Lee datos del puerto serie y los muestra en formato hexadecimal.