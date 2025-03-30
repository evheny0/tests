## Solution classes diagram

```mermaid
  flowchart LR
    App --> Calculator
    App --> InputParser
    InputParser --> Item
    Item --> Category
    Calculator --> BasicSalesTax
    Calculator --> ImportDuty
    Calculator --> Receipt
    App --> Printer
    main.rb --> App
```
