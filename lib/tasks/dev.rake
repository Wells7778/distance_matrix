namespace :dev do
  task change_no: :environment do
    services = Service.all
    services.each do |service|
      service.no = service.no.slice(3,5)
      service.save
    end
  end
end