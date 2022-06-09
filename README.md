# Notas de la clase

## Active Record

  El active record es el ORM o manejador de base de datos de rails, con el puedes realizar consultas a la bd y definir las relaciones entre
  las tablas de la base de datos, es agnóstico de la implementación asi que puedes usar el mismo código con diferentes bases de datos,
  en los proyectos se recomienda usar la minima cantidad de SQL para que a la hora de realizar un cambio de BD para la aplicación sea completamente
  transparente que se puedan usar diferentes bases de datos.

### Métodos de los objetos
  en rails toda clase hereda de un objeto o clase superior, en el caso del active record se usa Aplication Record y a partir de esta clase se nos heredan
  distintos métodos que podemos it utilizando para nuestro proyecto.

  El método .new permite instanciar un objeto con los atributos definidos en el modelo y con valores por defecto en nil

  `#<Course:0x0000ffffa9868810 id: nil, title: nil, description: nil, created_at: nil, updated_at: nil>`

  El método .persisted? va a retornar true o false dependiendo de si el objeto desde el que lo estamos llamando se encuentra guardado en la base de datos.

  El método .new_record? va a retornar true o false dependiendo de si el objeto desde el que lo estamos llamando no esta guardado en la base de datos.

  El método .save permite persistir en la base de datos la instancia del objeto que tenemos creada junto a sus atributos, por asi decirlo el método save
  respeta y usa las convenciones del framework y completa por nosotros el created_at y el updated_at que son datos que el propio rails maneja por debajo
  para llevar el control de los datos en la BD, con el (validate:false) el metodo save se salta las validaciones de los modelos.

  Como complemento al método save existe una variante .save! que lo que hace de diferente es lanzar un error de ejecución para cuando la persistencia en la base de datos no se pueda completar (al generar un error de sistema hay que tener cuidado en el manejo para que la aplicación no presente comportamientos inesperados).

  El método .valid? permite conocer si los valores que se han asignado a la instancia de la clase pasan las validaciones del modelo y poseen valores correctos para persistirse correctamente.

  El método .erros permite conocer cuales son los errores que están impidiendo que podamos guardar la instancia de la clase en la BD, este método se puede complementar con .messages para tener mas contexto de los errores.

### Validaciones

  Las validaciones nos permiten confirmar que los datos que estamos guardando en el objeto o instancia de la clase llevan el formato o el valor correcto,
  para usar las validaciones predefinidas por el rails se una la palabra Validates, si quieres usar valdiaciones definidas por nosotros mismos usamos validate.

  ``` [ruby]
  class Video < ApplicationRecord

    belongs_to :course

    validates :title, presence: true, message: 'El título es requerido.'
    validates :title, uniqueness: true
    validates :title, length: { maximus: 200, minimun: 2 }

    validate :custome_title
    
    private

    def custom_title
      erros.add(:title, 'No es posible usar ese título.') if title == '1234'
    end

  end
  ```

### Callbacks

  Los callbacks son métodos que se ejecutan despues o antes de una acción en particular, los mas comunes son antes o despues de hacer un save, create
  update, destroy y validation.

  se utilizan con de la siguiente manera y se pueden llamar tantas veces como queramos:

  `before_save :send_notification`

  el callback se puede condicionar con un bloque if 

  `before_save :send_notification, if true`

### MÉTODOS DE INSTANCIA

  los métodos de instancia se comportan de distintas maneras, hay algunos métodos que debemos conocer para entender su comportamiento, entre los cuales se encuentran los update_attributes, update_column, update_columns.

  la mejor forma de eliminar varios objetos es el delete_all

  objeto.update perimete actualizar directamente attributos del objeto, el metodo objeto.update_attribute te permite actualizar un atributo a la vez pero puede ser peligroso porque se saltará las validaciones

  objeto.update_column se saltara las validaciones y se saltara los callbaks

  objeto.update_columsn se saltara las validaciones, los callbaks y no actualizara los timestamp

### Scopes

  son la forma de reutilizar consultas comunes a las bases de datos.

  `scope :metodo, -> {codition}`
