from seymour.utils import tensor_difference

class Optimizer(object):
    def __init__(self, model):
        self.model = model

    def optimize(self, population_size, epochs, alpha):
        self.population = [self.model() for _ in range(population_size)]
        
        for _ in range(epochs):
            children_population = [agent.reproduce(alpha) for agent in self.population]

            self.population = self.population + children_population

            for agent in self.population:
                agent.update_error()
            
            self.population.sort(key=lambda agent: agent.error)
            self.population = self.population[:int(len(self.population) / 2)]

            print()
            print("⏰  epoch: " + str(_))
            print("💪  min error: " + str(self.population[0].error))

        return self.population[0]
                    

            
            
