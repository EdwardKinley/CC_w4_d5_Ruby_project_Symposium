require_relative("../models/delegate.rb")
require_relative("../models/presentation.rb")
require_relative("../models/registration.rb")
require("pry-byebug")

Registration.delete_all()
Presentation.delete_all()
Delegate.delete_all()

delegate1 = Delegate.new({"name" => "Colby Galileo", "board_member" => true})

delegate2 = Delegate.new({"name" => "Thomas Feser"})

delegate3 = Delegate.new({"name" => "Serena Davids", "board_member" => true})

delegate4 = Delegate.new({"name" => "Neil Oderberg"})

delegate5 = Delegate.new({"name" => "Ellen Ockham"})

delegate1.save()
delegate2.save()
delegate3.save()
delegate4.save()
delegate5.save()

presentation1 = Presentation.new({"name" => "Io, Io, it's Off to Space We Go", "time_slot" => 1, "capacity" => 50})

presentation2 = Presentation.new({"name" => "Europa League", "time_slot" => 2, "capacity" => 40})

presentation3 = Presentation.new({"name" => "Gonnae Meet Ganymede", "time_slot" => 3, "capacity" => 10})

presentation4 = Presentation.new({"name" => "Callisto Calypso", "time_slot" => 3, "capacity" => 4})

presentation5 = Presentation.new({"name" => "Meeting Metis", "time_slot" => 4, "capacity" => 50})

presentation6 = Presentation.new({"name" => "Adrastea and Amalthea", "time_slot" => 5, "capacity" => 10})

presentation7 = Presentation.new({"name" => "Thebe Themes", "time_slot" => 5, "capacity" => 5})

presentation1.save()
presentation2.save()
presentation3.save()
presentation4.save()
presentation5.save()
presentation6.save()
presentation7.save()

registration1 = Registration.new({"delegate_id" => delegate1.id, "presentation_id" => presentation1.id})

registration1.save()

registration2 = delegate1.register(presentation1)
registration3 = delegate1.register(presentation2)
registration4 = delegate1.register(presentation3)
registration5 = delegate1.register(presentation4)
registration6 = delegate1.register(presentation7)
registration7 = delegate2.register(presentation5)
registration8 = delegate3.register(presentation6)
registration9 = delegate3.register(presentation7)
registration10 = delegate4.register(presentation2)
registration11 = delegate5.register(presentation3)
