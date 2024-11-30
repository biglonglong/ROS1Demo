#ifndef PLUGINGRAPH_H_
#define PLUGINGRAPH_H_
#include "plugin/basegraph.h"

namespace plugingraph_ns {
    class plugin_triangle:public basegraph_ns::Basegraph {
        private:
            double length;
        public:
            plugin_triangle(){
                length = 0.0;
            }
            void init(double length) {
                this->length = length;
            }
            double getlength() {
                return this->length * 3;
            }   
    };

    class plugin_square:public basegraph_ns::Basegraph {
        private:
            double length;
        public:
            plugin_square(){
                length = 0.0;
            }
            void init(double length) {
                this->length = length;
            }
            double getlength() {
                return this->length * 4;
            }   
    };
}

#endif