#ifndef BASEGRAPH_H_
#define BASEGRAPH_H_

namespace basegraph_ns {
    class Basegraph {
        protected:
            Basegraph(){}
        public:
            virtual double getlength() = 0;
            virtual void init(double length) = 0;
    };
}

#endif