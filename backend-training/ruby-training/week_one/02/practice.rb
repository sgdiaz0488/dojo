# Write a script to set up core reviews for all reviewees
# Rules are:
# 1. 2 random reviewers per reviewee
# 2. When the reviewers are selected send an e-mail to the reviewee informing them of the selection
# 3. After the email is sent, create a txt file format of the email for each reviewee, with the following format:
#   E-mail to: kurenn@icalialabs.com
#   Body:
#   Hi Abraham Kuri
#   Your reviewers are Walter and Vov
#   Sent at: 2018-01-07 20:21:43 -0600
#   ---
## Hint!
# rand(n) gives you a random number from 0 to n
# Check the `Time` class on the ruby docs
#
## Sample output:
## Sending E-mail to: kurenn@icalialabs.com
## Hi Abraham Kuri
## Your reviewers are Walter and Vov

REVIEWERS = [
  { name: "Walter" },
  { name: "Vov" },
  { name: "Cejas" },
  { name: "Kuri" },
  { name: "Sherwell" },
]

REVIEWEES = [
  { name: "Barbara", email: "bmbrina@icalialabs.com" },
  { name: "Hector", email: "hector@icalialabs.com" },
  { name: "Kevin", email: "kevin@icalialabs.com" },
  { name: "Julian", email: "julz@icalialabs.com" },
  { name: "Luis Gerardo", email: "gvaldez@icalialabs.com" },
  { name: "Cesar Nava", email: "cnava@icalialabs.com" },
]

## Your script starts here

REVIEWERS = [
  { name: "Walter" },
  { name: "Vov" },
  { name: "Cejas" },
  { name: "Kuri" },
  { name: "Sherwell" },
]

REVIEWEES = [
{ name: "Barbara", email: "bmbrina@icalialabs.com" },
{ name: "Hector", email: "hector@icalialabs.com" },
{ name: "Kevin", email: "kevin@icalialabs.com" },
{ name: "Julian", email: "julz@icalialabs.com" },
{ name: "Luis Gerardo", email: "gvaldez@icalialabs.com" },
{ name: "Cesar Nava", email: "cnava@icalialabs.com" },
]

# Devuelve aleatoriamente una cantidad de elementos de los datos
def delvolverRevisores(cantidad, listado)
seleccionados = []

while seleccionados.size < cantidad do
  index = rand(listado.size)
  seleccionados << listado[index]
  seleccionados.uniq!
end

seleccionados
end

# Devuelve el texto del email
def prepararCorreoElectronico(nombre, email, revisores)
"E-mail to: #{email}
        Body:

        Hi, #{nombre}.
        Your reviewers are #{revisores[0][:name]} and #{revisores[1][:name]}.
        "
end

# Imprime el email
def mandarEmailsDeListado(listado_alumnos)
listado_alumnos.each do |alumno|
  revisores = delvolverRevisores(2, REVIEWERS)
  nombre_alumno = alumno[:name]
  email_alumno = alumno[:email]

  puts prepararCorreoElectronico(nombre_alumno, email_alumno, revisores)
end
end

# Ejecutar metodo - Mandar emails
mandarEmailsDeListado(REVIEWEES)


## Your script ends here
