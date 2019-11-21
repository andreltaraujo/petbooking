namespace :dev do

  desc "Cadastra dados básicos para uso em desenvolvimento"
    task setup: :environment do
      if Rails.env.development?
        show_spinner("Apagando DB...") { %x(rails db:drop:_unsafe) }
        show_spinner("Criando DB...") { %x(rails db:create) }
        show_spinner("Migrando DB...") { %x(rails db:migrate) } 
        show_spinner("Cadastrando TIPOS...") { %x(rails dev:add_kinds) }
        show_spinner("Cadastrando PETS 'cat'") { %x(rails dev:add_pets_cat) }
        show_spinner("Cadastrando PETS 'dog'") { %x(rails dev:add_pets_dog) }
        show_spinner("Cadastrando PRONTUÁRIOS") { %x(rails dev:add_medical_records) }
      else
        puts "Você não está no ambiente do desenvolvimento!"
      end
    end
    
  desc "Adiciona os tipos cat/dog"
    task add_kinds: :environment do
      Kind.create!(
        [{description: "Cat"},
        {description: "Dog"}] 
      )
    end
  
    desc "Cadastra os Pets do tipo cat"
    task add_pets_cat: :environment do
      50.times do |c|
        Pet.create!(
          name: Faker::Creature::Cat.name,
          birthdate: Faker::Date.birthday(max_age: 18),
          breed: Faker::Creature::Cat.breed,
          kind: Kind.first
        ) 
      end
    end

    desc "Cadastra os Pets do tipo dog"
      task add_pets_dog: :environment do
        50.times do |d|
          Pet.create!(
            name: Faker::Creature::Dog.name,
            birthdate: Faker::Date.birthday(max_age: 18),
            breed: Faker::Creature::Dog.breed,
            kind: Kind.last
          ) 
        end
      end

      desc "Cadastra os Prontuários"
        task add_medical_records: :environment do
          10.times do |c|
            MedicalRecord.create!(
              patient_symptoms: Faker::Lorem.words,
              applied_treatment: Faker::Lorem.sentence,
              pet: Pet.all.sample
            ) 
          end
        end

  private
  
  def show_spinner(msg_start, msg_end = "Concluído!")
    spinner = TTY::Spinner.new("[:spinner] #{msg_start}")
    spinner.auto_spin
    yield
    spinner.success("(#{msg_end})")
  end

end