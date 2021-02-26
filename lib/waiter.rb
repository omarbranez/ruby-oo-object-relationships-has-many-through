class Waiter
    attr_accessor :name, :yrs_experience

    @@all = []

    def initialize(name, yrs_experience)
        @name = name
        @yrs_experience
        @@all << self
    end

    def self.all
        @@all
    end

    def new_meal(customer, total, tip = 0)
        Meal.new(self, customer, total, tip)
    end

    def meals
        Meal.all.select {|meal| meal.waiter == self}
    end

    def best_tipper
        #meals.all.max_by {|meal| meal.tip}
        best_tipped_meal = meals.max {|meal_a, meal_b| meal_a.tip <=> meal_b.tip}
        #spaceship keeps checking to see which one is -1 (less than), 0 (equal), or 1 (greater than) and only return the 1 (the GREATEST)
        best_tipped_meal.customer
        #and returns the customer that meal belongs to
    end
    
end