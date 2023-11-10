# House Energy Patterns : Decorator, Adapter, Factory, Fluent Builder

This repository contains the example code for a couple of talks given at the EMEA and US PUG Challenges in 2023.

The code should run with nearly any version of OpenEdge that supports OOABL.

The exceptions to this are the OpenEdge.Core.IAdaptable interface and its implementation in the HouseDecorator class.

- The interface was only added to the OpenEdge product in version 11.7.0; however, the code from https://github.com/consultingwerk/ADE-Sourcecode/blob/master/src/corelib/OpenEdge/Core/IAdaptable.cls can be used.
- The implementation in the `Consultingwerk.Demo.Decorator.HouseDecorator` class uses a `IsA()` method on `Progress.Lang.Class` that was added around 11.5.0.
- Certain examples use the `GET-CLASS()` function, which was also added around the 11.5.0 timeframe.


